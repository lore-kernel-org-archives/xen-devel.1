From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v3 0/4] x86/HVM: implement memory read
 caching
Date: Tue, 02 Oct 2018 04:36:01 -0600
Message-ID: <5BB34A1102000078001EDABE@prv1-mh.provo.novell.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5BAA42D102000078001EBBEB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7I2C-0002Mg-KV
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 10:36:08 +0000
In-Reply-To: <5BAA42D102000078001EBBEB@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA5LjE4IGF0IDE2OjE0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IEVt
dWxhdGlvbiByZXF1aXJpbmcgZGV2aWNlIG1vZGVsIGFzc2lzdGFuY2UgdXNlcyBhIGZvcm0gb2Yg
aW5zdHJ1Y3Rpb24KPiByZS1leGVjdXRpb24sIGFzc3VtaW5nIHRoYXQgdGhlIHNlY29uZCAoYW5k
IGFueSBmdXJ0aGVyKSBwYXNzIHRha2VzCj4gZXhhY3RseSB0aGUgc2FtZSBwYXRoLiBUaGlzIGlz
IGEgdmFsaWQgYXNzdW1wdGlvbiBhcyBmYXIgYXMgdXNlIG9mIENQVQo+IHJlZ2lzdGVycyBnb2Vz
IChhcyB0aG9zZSBjYW4ndCBjaGFuZ2Ugd2l0aG91dCBhbnkgb3RoZXIgaW5zdHJ1Y3Rpb24KPiBl
eGVjdXRpbmcgaW4gYmV0d2VlbiksIGJ1dCBpcyB3cm9uZyBmb3IgbWVtb3J5IGFjY2Vzc2VzLiBJ
biBwYXJ0aWN1bGFyCj4gaXQgaGFzIGJlZW4gb2JzZXJ2ZWQgdGhhdCBXaW5kb3dzIG1pZ2h0IHBh
Z2Ugb3V0IGJ1ZmZlcnMgdW5kZXJuZWF0aAo+IGFuIGluc3RydWN0aW9uIGN1cnJlbnRseSB1bmRl
ciBlbXVsYXRpb24gKGhpdHRpbmcgYmV0d2VlbiB0d28gcGFzc2VzKS4KPiBJZiB0aGUgZmlyc3Qg
cGFzcyB0cmFuc2xhdGVkIGEgbGluZWFyIGFkZHJlc3Mgc3VjY2Vzc2Z1bGx5LCBhbnkgc3Vic2Vx
dWVudAo+IHBhc3MgbmVlZHMgdG8gZG8gc28gdG9vLCB5aWVsZGluZyB0aGUgZXhhY3Qgc2FtZSB0
cmFuc2xhdGlvbi4KPiAKPiBJbnRyb2R1Y2UgYSBjYWNoZSAodXNlZCBqdXN0IGJ5IGd1ZXN0IHBh
Z2UgdGFibGUgYWNjZXNzZXMgZm9yIG5vdywgaS5lLgo+IGEgZm9ybSBvZiAicGFnaW5nIHN0cnVj
dHVyZSBjYWNoZSIpIHRvIG1ha2Ugc3VyZSBhYm92ZSBkZXNjcmliZWQKPiBhc3N1bXB0aW9uIGhv
bGRzLiBUaGlzIGlzIGEgdmVyeSBzaW1wbGlzdGljIGltcGxlbWVudGF0aW9uIGZvciBub3c6IE9u
bHkKPiBleGFjdCBtYXRjaGVzIGFyZSBzYXRpc2ZpZWQgKG5vIG92ZXJsYXBzIG9yIHBhcnRpYWwg
cmVhZHMgb3IgYW55dGhpbmcpLgo+IAo+IFRoZXJlJ3MgYWxzbyBzb21lIHNlZW1pbmdseSB1bnJl
bGF0ZWQgY2xlYW51cCBoZXJlIHdoaWNoIHdhcyBmb3VuZAo+IGRlc2lyYWJsZSBvbiB0aGUgd2F5
Lgo+IAo+IDE6IHg4Ni9tbTogYWRkIG9wdGlvbmFsIGNhY2hlIHRvIEdMQS0+R0ZOIHRyYW5zbGF0
aW9uCj4gMjogeDg2L21tOiB1c2Ugb3B0aW9uYWwgY2FjaGUgaW4gZ3Vlc3Rfd2Fsa190YWJsZXMo
KQo+IDM6IHg4Ni9IVk06IGltcGxlbWVudCBtZW1vcnkgcmVhZCBjYWNoaW5nCj4gNDogeDg2L0hW
TTogcHJlZmlsbCBjYWNoZSB3aXRoIFBEUFRFcyB3aGVuIHBvc3NpYmxlCj4gCj4gQXMgZm9yIHYy
LCBJJ20gb21pdHRpbmcgIlZNWDogY29ycmVjdCBQRFBURSBsb2FkIGNoZWNrcyIgZnJvbSB2Mywg
YXMgSQo+IGNhbid0IGN1cnJlbnRseSBmaW5kIGVub3VnaCB0aW1lIHRvIGNhcnJ5IG91dCB0aGUg
cmVxdWVzdGVkIGZ1cnRoZXIKPiByZXdvcmsuCgpBbmRyZXcsIEdlb3JnZT8KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
