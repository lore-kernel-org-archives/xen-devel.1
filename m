From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Weird altp2m behaviour when switching early to a new
 view
Date: Sun, 8 Apr 2018 23:38:31 +0300
Message-ID: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qprd=g5=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f5H5S-00021N-Ag
 for xen-devel@lists.xenproject.org; Sun, 08 Apr 2018 20:38:54 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id A476D3100BAA
 for <xen-devel@lists.xenproject.org>; Mon,  9 Apr 2018 00:54:54 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id E184E7FC7A
 for <xen-devel@lists.xenproject.org>; Sun,  8 Apr 2018 23:38:51 +0300 (EEST)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpJJ3ZlIG5vdGljZWQgYWx0cDJtIGJlaGF2aW91ciBJIGNhbid0IGV4cGxhaW4geWV0
IC0gSSdtIG5vdCBhbGwgdGhhdApmYW1pbGlhciB3aXRoIGFsbCB0aGUgd2F5cyB0aGUgbmV3IHZp
ZXdzIGNvcmVsbGF0ZSB3aXRoIHRoZSBwcmV2aW91cwpFUFQtYmFzZWQgInZpZXcgMCIuCgpJbiBz
aG9ydCwgaWYgd2UgY3JlYXRlIGEgbmV3IHZpZXcgYW5kIHNpbXBseSBzd2l0Y2ggdG8gaXQgZWFy
bHkgaW4gdGhlCmJvb3QgcHJvY2VzcyBvZiB0aGUgZ3Vlc3QsIHNvbWV0aGluZyBnb2VzIHdyb25n
IGFuZCB0aGUgZ3Vlc3QgZWl0aGVyCmZyZWV6ZXMsIGJlY29tZXMgdW5yZXNwb25zaXZlIHRvIGlu
cHV0LCBvciBoYXMgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlCmRpc3BsYXkgKG1vc3Qgb2Z0ZW4g
dGhlIGxhdHRlciwgd2l0aCBhIGJsYWNrIGJhbmQgb24gdG9wIG9mIHRoZSBpbWFnZSk6CgpodHRw
czovL2liYi5jby9lVVBKNmMKaHR0cHM6Ly9pYmIuY28vZXRDWFhICgpUaGF0IGd1ZXN0IGlzIGEg
NjQtYml0IFdpbmRvd3MgNyBzeXN0ZW0gd2l0aCBub3RoaW5nIHNwZWNpYWwgYWJvdXQgaXQuCkl0
J3MgZWFzeSB0byByZXByb2R1Y2UgdGhpczoKCjEuIFN0YXJ0IHRoZSBndWVzdCBwYXVzZWQgKEkn
dmUgdXNlZCAieGwgY3JlYXRlIC1wIG15Z3Vlc3QuY29uZiIpLgoyLiBQYXRjaCB4ZW4tYWNjZXNz
IGxpa2UgdGhpczogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vNjdQcFE5ZnUgKGp1c3QKcmVtb3ZlIHRo
ZSBwYXJ0IG9mIHRoZSBjb2RlIHRoYXQgbW9kaWZpZXMgdGhlIG5ldyB2aWV3IGJlZm9yZSBzd2l0
Y2hpbmcKdG8gaXQpLgozLiBIb29rIHhlbi1hY2Nlc3MgdG8gdGhlIGd1ZXN0ICgiLi94ZW4tYWNj
ZXNzIDxkb21pZD4gYWx0cDJtX3dyaXRlIikuCjQuIFVucGF1c2UgdGhlIGd1ZXN0ICgieGwgdW5w
YXVzZSA8ZG9taWQ+IikuCgpJIHRoaW5rIHRoYXQncyBhIHZhbGlkIHNjZW5hcmlvIGFuZCBzdXBw
b3NlZCB0byB3b3JrLgoKSSd2ZSBhbHNvIG5vdGljZWQgdGhhdCBpZiBJIHdhaXQgdG8gZG8gdGhp
cyB1bnRpbCB0aGUgT1MgaXMKdXAtYW5kLXJ1bm5pbmcgKGUuZy4gYWZ0ZXIgbG9nZ2luZyBpbnRv
IFdpbmRvd3MpLCB0aGVyZSBzZWVtcyB0byBiZSBubwpwcm9ibGVtLiBJIGRvbid0IGtub3cgaWYg
dGhpcyBpcyBqdXN0IGNvaW5jaWRlbmNlIChhcyBpcyBib3VuZCB0byBoYXBwZW4Kd2l0aCByYWNl
LWNvbmRpdGlvbiBzaXR1YXRpb25zKSwgb3IgbWVhbnMgc29tZXRoaW5nLCBidXQgSSBjYW4gZ2V0
IHRoZQpwcm9ibGVtcyBldmVyeSB0aW1lIHdoZW4gc3dpdGNoaW5nIHZpZXdzIGVhcmx5LCBhbmQg
bmV2ZXIgd2hlbiBzd2l0Y2hpbmcKdGhlIHZpZXdzIGxhdGUuCgpTdWdnZXN0aW9ucyBvbiB3aGF0
IHRoZSBwcm9ibGVtIGNvdWxkIGJlIGFyZSwgYXMgYWx3YXlzLCBncmVhdGx5CmFwcHJlY2lhdGVk
LgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
