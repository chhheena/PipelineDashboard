// Third party modules
import { firestore } from 'firebase';

// Dashboard hub models
import { AccessModel } from './access.model';

export class MonitorModel {
  uid?: string = '';
  type?: 'private' | 'public' = 'public';
  title?: string = '';
  description?: string = '';
  access?: AccessModel = new AccessModel();
  repositories?: string[] = [];
  createdOn?: firestore.Timestamp;
  updatedOn: firestore.Timestamp;

  constructor(uid: string = '') {
    this.uid = uid;
  }
}
