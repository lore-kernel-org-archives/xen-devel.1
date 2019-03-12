From: "=?ISO-8859-1?B?amluY2hlbg==?=" <jinchen1227@qq.com>
Subject: Xen ARM smmu questions
Date: Tue, 12 Mar 2019 16:58:53 +0800
Message-ID: <tencent_4E03A65ACF45B3490239A3A479F5E64FA506@qq.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4688285657637474240=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GeiQ=RP=qq.com=jinchen1227@srs-us1.protection.inumbo.net>)
 id 1h3dFY-0002zk-6v
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 08:59:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?ISO-8859-1?B?eGVuLWRldmVs?= <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.

--===============4688285657637474240==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5C8774CD_0CB6E038_19DFC8C1"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5C8774CD_0CB6E038_19DFC8C1
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGVsbG8geGVuLWRldmVsLCANCkknbSByZWFkaW5nIHRoZSBjb2RlIG9mIHhlbiBhcm0gc21t
dSBpbiBkcml2ZXJzL3Bhc3N0aHJvdWdoL2FybSwgYW5kIEkgaGF2ZSBzb21lIHF1ZXN0aW9u
cyB0aGF0IGNvbmZ1c2VkIG1lLg0KSSB0aGluayBpZiB0aGUgYm9hcmQgdXNlIFNNTVUsIHhl
biB3aWxsIHRha2UgY2hhcmdlIG9mIGl0IGJlZm9yZSBkb20wIGJvb3QsIGFuZCB3aWxsIG5v
dCBwYXNzIHRoZSBub2RlIG9mIFNNTVUgdG8gZG9tMCBpbiBkZXZpY2UgdHJlZSwNCnNvIG15
IHF1ZXN0aW9uIGlzIGhvdyBkb20wIHVzZSBTTU1VPyBvciBjYW4gZG9tMCB1c2UgU01NVT8g
V2hhdCBkb20wIHVzZSBpZiBpdCB3YW50cyB0byB1c2UgSU9NTVU/DQpXaGF0IGFib3V0IGRv
bVU/IFRoZSBTTU1VIGNvdWxkIGJlIHBhc3NlZCB0byBkb21VPw0KVGhhbmsgeW91IQ==

------=_NextPart_5C8774CD_0CB6E038_19DFC8C1
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyB4ZW4tZGV2ZWwsJm5ic3A7PC9kaXY+PGRpdj5JJ20gcmVhZGluZyB0aGUg
Y29kZSBvZiB4ZW4gYXJtIHNtbXUgaW4gZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0sIGFuZCBJ
IGhhdmUgc29tZSBxdWVzdGlvbnMgdGhhdCBjb25mdXNlZCBtZS48L2Rpdj48ZGl2PkkgdGhp
bmsgaWYgdGhlIGJvYXJkIHVzZSBTTU1VLCB4ZW4gd2lsbCB0YWtlIGNoYXJnZSBvZiBpdCBi
ZWZvcmUgZG9tMCBib290LCBhbmQgd2lsbCBub3QgcGFzcyB0aGUgbm9kZSBvZiBTTU1VIHRv
IGRvbTAgaW4gZGV2aWNlIHRyZWUsPC9kaXY+PGRpdj5zbyBteSBxdWVzdGlvbiBpcyBob3cg
ZG9tMCB1c2UgU01NVT8gb3IgY2FuIGRvbTAgdXNlIFNNTVU/IFdoYXQgZG9tMCB1c2UgaWYg
aXQgd2FudHMgdG8gdXNlIElPTU1VPzwvZGl2PjxkaXY+V2hhdCBhYm91dCBkb21VPyBUaGUg
U01NVSBjb3VsZCBiZSBwYXNzZWQgdG8gZG9tVT88L2Rpdj48ZGl2PlRoYW5rIHlvdSE8L2Rp
dj4=

------=_NextPart_5C8774CD_0CB6E038_19DFC8C1--





--===============4688285657637474240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4688285657637474240==--
