From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 0/7] SUPPORT.md: Distinguish descriptions
 from caveats
Date: Tue, 17 Apr 2018 15:46:55 +0100
Message-ID: <1523976422-19799-1-git-send-email-ian.jackson@eu.citrix.com>
References: <fa4e69bb-8278-4aec-960b-c0db32ef5503@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uw82=hg=citrix.com=prvs=638ae18cd=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f8Rt0-0004Is-DN
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:47:10 +0000
In-Reply-To: <fa4e69bb-8278-4aec-960b-c0db32ef5503@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG5ldyBzdXBwb3J0IG1hdHJpeCBvdXRwdXQgcHV0cyBhIFsqXSBhZnRlciBlYWNoIGVudHJ5
IGluIHRoZQpzdXBwb3J0IG1hdHJpeCBpbiBtYW55IGNhc2VzIHdoZXJlIHRoZSBsaW5rZWQtdG8g
dGV4dCBpcyBzaW1wbHkgYQpsb25nZXIgZGVzY3JpcHRpb24gb2YgdGhlIGZlYXR1cmUuCgpSZW1l
ZHkgdGhpcyBieSBkaXN0aW5ndWlzaGluZyB0ZXh0IHdoaWNoIGV4cGFuZHMgb24gYSBmZWF0dXJl
CmRlc2NyaXB0aW9uIGZyb20gdGV4dCB3aGljaCBxdWFsaWZpZXMgaXRzIHN1cHBvcnQgc3RhdHVz
LgoKVGhlcmUgYXJlIDMgcGF0Y2hlcyB0byBwcm9jZXNzaW5nIG1hY2hpbmVyeSwgZm9sbG93ZWQg
YnkgdHdvIHBhdGNoZXMKdG8gU1VQUE9SVC5tZCAob25lIHRvIG1ha2UgdGhlIGRpc3RpbmN0aW9u
LCB0aHJvdWdob3V0LCBhbmQgb25lIHRvCmRvY3VtZW50IGl0KTsgZm9sbG93ZWQgYnkgdHdvIHBh
dGNoZXMgdG8gZml4IGEgYnVnIChsb2dpY2FsbHkgdGhlc2UKc2hvdWxkIGNvbWUgZmlyc3QsIGJ1
dCByZWJhc2luZyB0aGVtIGlzIGFubm95aW5nKS4KClRoZSBwYXRjaGVzIHRvIFNVUFBPUlQubWQg
d291bGQgaWRlYWxseSBnbyB0byA0LjEwIHRvby4KCkV4YW1wbGUgb3V0cHV0OgogIGh0dHBzOi8v
eGVuYml0cy54ZW4ub3JnL3Blb3BsZS9pd2ovMjAxOC9zdXBwb3J0LW1hdHJpeC1leGFtcGxlLUIt
djIvdC5odG1sCgogICByIDEvNyAgZG9jcy9wYXJzZS1zdXBwb3J0LW1kOiBpbnRlcm5hbHM6IElu
dHJvZHVjZSBkb2NyZWZfYQogICByIDIvNyAgZG9jcy9wYXJzZS1zdXBwb3J0LW1kOiBpbnRlcm5h
bHM6IFJlbmFtZSBIYXNUZXh0IHRvCiAgIHIgMy83ICBTVVBQT1JULm1kLCBzdXBwb3J0IG1hdHJp
eDogVHJlYXQgY29tbWVudGFyeSBiZWZvcmUKICAqciA0LzcgIFNVUFBPUlQubWQ6IE1vdmUgZGVz
Y3JpcHRpb25zIHVwIGJlZm9yZSBTdGF0dXMgaW5mbwogYSByIDUvNyAgU1VQUE9SVC5tZDogRG9j
dW1lbnQgdGhlIG5ldyB0ZXh0IG9yZGVyaW5nIHJ1bGUKICArICA2LzcgIGRvY3MvcGFyc2Utc3Vw
cG9ydC5tZDogQWRkIHNvbWUgbmV3bGluZXMgdG8gdGhlIHRhYmxlCiAgKyAgNy83ICBkb2NzL3Bh
cnNlLXN1cHBvcnQtbWQ6IENvcnJlY3RseSBoYW5kbGUgZm9vdG5vdGVzIGZvcgoKICsgPSBOZXcg
cGF0Y2ggaW4gdjIKICogPSBBbWVuZGVkIHBhdGNoIGluIHYyCiByID0gUmVsZWFzZS1hY2tlZAog
YSA9IEFja2VkIGJ5IGFwcHJvcHJpYXRlIG1haW50YWluZXIgYW5kL29yIGNvbW11bml0eSBtYW5h
Z2VyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
