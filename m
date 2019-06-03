From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: Make the altp2m locking in
 hvm_hap_nested_page_fault() easier to follow
Date: Mon, 3 Jun 2019 12:40:16 +0000
Message-ID: <E6E7623B-3C1C-41E7-BC98-8F7CFC989171@citrix.com>
References: <1559565226-19789-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Nnt=UC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hXmGH-0005gI-NN
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:40:25 +0000
In-Reply-To: <1559565226-19789-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
Content-ID: <5E25915C63541945AEA845A5282E9682@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gSnVuIDMsIDIwMTksIGF0IDE6MzMgUE0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gRHJvcCB0aGUgYXAybV9hY3RpdmUgYm9v
bGVhbiwgYW5kIGNvbnNpc3RlbnRseSB1c2UgdGhlIHVubG9ja2luZyBmb3JtOg0KPiANCj4gIGlm
ICggcDJtICE9IGhvc3RwMm0gKQ0KPiAgICAgICBfX3B1dF9nZm4ocDJtLCBnZm4pOw0KPiAgX19w
dXRfZ2ZuKGhvc3RwMm0sIGdmbik7DQo+IA0KPiB3aGljaCBtYWtlcyBpdCBjbGVhciB0aGF0IHdl
IGFsd2F5cyB1bmxvY2sgdGhlIGFsdHAybSdzIGdmbiBpZiBpdCBpcyBpbiB1c2UsDQo+IGFuZCBh
bHdheXMgdW5sb2NrIHRoZSBob3N0cDJtJ3MgZ2ZuLiAgVGhpcyBhbHNvIGRyb3BzIHRoZSB0ZXJu
YXJ5IGV4cHJlc3Npb24NCj4gaW4gdGhlIGxvZ2RpcnR5IGNhc2UuDQo+IA0KPiBFeHRlbmQgdGhl
IGxvZ2RpcnR5IGNvbW1lbnQgdG8gaWRlbnRpZnkgd2hlcmUgdGhlIGxvY2tpbmcgdmlvbGF0aW9u
IGlzIGxpYWJsZQ0KPiB0byBvY2N1ci4NCj4gDQo+IE5vIChpbnRlbmRlZCkgb3ZlcmFsbCBjaGFu
Z2UgaW4gYmVoYXZpb3VyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCg0KTm90aWNlZCB0aGlzIHdoZW4gcmV2aWV3aW5nIFRhbWFz4oCZ
IHBhdGNoIOKAlCB0aGFua3M6DQoNCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
