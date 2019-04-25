From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [livepatch-build-tools part3 1/3]
 create-diff-object: Do not create empty .livepatch.funcs section
Date: Thu, 25 Apr 2019 20:29:16 +0100
Message-ID: <bc6b1f1a-5004-4b98-c91d-f9d8acbf0c8b@citrix.com>
References: <20190416122241.28342-1-wipawel@amazon.de>
 <20190425045104.GD11831@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJk3n-0004xS-CQ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 19:29:31 +0000
In-Reply-To: <20190425045104.GD11831@char.us.oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAwNTo1MSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+IE9uIFR1
ZSwgQXByIDE2LCAyMDE5IGF0IDEyOjIyOjM5UE0gKzAwMDAsIFBhd2VsIFdpZWN6b3JraWV3aWN6
IHdyb3RlOgo+PiBXaGVuIHRoZXJlIGlzIG5vIGNoYW5nZWQgZnVuY3Rpb24gaW4gdGhlIGdlbmVy
YXRlZCBwYXlsb2FkLCBkbyBub3QKPj4gY3JlYXRlIGFuIGVtcHR5IC5saXZlcGF0Y2guZnVuY3Mg
c2VjdGlvbi4gSHlwZXJ2aXNvciBjb2RlIGNvbnNpZGVycwo+PiBzdWNoIHBheWxvYWRzIGFzIGJy
b2tlbiBhbmQgcmVqZWN0cyB0byBsb2FkIHRoZW0uCj4+Cj4+IFN1Y2ggcGF5bG9hZHMgd2l0aG91
dCBhbnkgY2hhbmdlZCBmdW5jdGlvbnMgbWF5IGFwcGVhciB3aGVuIG9ubHkKPj4gaG9va3MgYXJl
IHNwZWNpZmllZC4KPiBSb3NzLCBJIGFtIGdvaW5nIHRvIHB1c2ggdGhpcyBpbiBuZXh0IHdlZWsg
dW5sZXNzIHlvdSBoYXZlIG90aGVyIHRob3VnaHRzPwoKTm8gb2JqZWN0aW9ucywgYnV0IGFzIHRo
ZSBDUjogbGlua3MgYXJlIGludGVybmFsIGxpbmtzLCB3aGljaCBnZXQgdGhlCmZvbGxvd2luZyBt
ZXNzYWdlIHdoZW4gZm9sbG93ZWQ6Cgo+IE5vbi1BbWF6b24gRW1wbG95ZWVzLCB5b3UgaGF2ZSBi
ZWVuIG1pc3Rha2VubHkgZGlyZWN0ZWQgdG8gYW4KPiBpbnRlcm5hbC1vbmx5IEFtYXpvbiBzeXN0
ZW0uIElmIHlvdSB3ZXJlIGdpdmVuIGEgbGluayB0aGF0IGJyb3VnaHQgeW91Cj4gdG8gdGhpcyBw
YWdlLCBwbGVhc2UgbGV0IHRoZSBzb3VyY2UgcmVzcG9uc2libGUgZm9yIHRoZSBsaW5rIGtub3cg
dGhhdAo+IHRoZSBsaW5rIHRoZXkgaGF2ZSBwcm92aWRlZCBkb2VzIG5vdCB3b3JrIGZvciBub24t
QW1hem9uIGVtcGxveWVlcy4KClRoZXkgc2hvdWxkIGJlIHN0cmlwcGVkIG91dCBvZiB0aGUgZXZl
bnR1YWwgY29tbWl0IG1lc3NhZ2VzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
