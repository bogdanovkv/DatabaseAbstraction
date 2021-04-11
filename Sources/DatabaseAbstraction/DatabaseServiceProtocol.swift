//
//  DatabaseServiceProtocol.swift
//  DatabaseAbstraction
//
//  Created by Константин Богданов on 05.04.2021.
//

/// Протокол сервиса общающегося с БД
public protocol DatabaseServiceProtocol {

	/// Извлекает модели из БД
	/// - Parameter convertClosure: блок для преобразования managed модели в обычную
	func fetch<Model>(convertClosure: (StoredObjectProtocol) -> Model?) -> [Model]

	/// Извлекает модели из БД
	/// - Parameters:
	///   - convertClosure: блок для преобразования managed модели в обычную
	///   - predicate: предикат для выборки моделей
	func fetch<Model>(convertClosure: (StoredObjectProtocol) -> Model?,
													predicate: [String: String]) -> [Model]

	/// Добавить модели в БД
	/// - Parameters:
	///   - models: модели
	///   - convertClosure: блок, в котором происходит установка свойст managed модели
	///   - completion: блок, выполняющийся по завершению сохранения моделей
	func insert<Model>(models: [Model],
												convertClosure: @escaping (Model, StoredObjectProtocol) -> Void,
												completion: @escaping () -> Void)
}
