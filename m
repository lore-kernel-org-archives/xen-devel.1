From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v3 1/2] x86: Meltdown band-aid against
 malicious 64-bit PV guests
Date: Tue, 16 Jan 2018 18:02:41 +0000
Message-ID: <CAFLBxZYEVw6oz2M24ZWQ+9Yb-iiwpR36AnhFBf2FNnLyLAwoRQ@mail.gmail.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5E2574020000780019F27A@prv-mh.provo.novell.com>
 <5A5E26A0020000780019F28C@prv-mh.provo.novell.com>
 <20180116172840.GF29360@bitfolk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=prux=el=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ebVZL-0005zF-TY
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 18:02:44 +0000
Received: by mail-qt0-x243.google.com with SMTP id c2so19310416qtn.9
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 10:02:42 -0800 (PST)
In-Reply-To: <20180116172840.GF29360@bitfolk.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Smith <andy@strugglers.net>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgNToyOCBQTSwgQW5keSBTbWl0aCA8YW5keUBzdHJ1Z2ds
ZXJzLm5ldD4gd3JvdGU6Cj4gSGkgSmFuLAo+Cj4gT24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMDg6
MjE6NTJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoaXMgaXMgYSB2ZXJ5IHNpbXBs
aXN0aWMgY2hhbmdlIGxpbWl0aW5nIHRoZSBhbW91bnQgb2YgbWVtb3J5IGEgcnVubmluZwo+PiA2
NC1iaXQgUFYgZ3Vlc3QgaGFzIG1hcHBlZCAoYW5kIGhlbmNlIGF2YWlsYWJsZSBmb3IgYXR0YWNr
aW5nKTogT25seSB0aGUKPj4gbWFwcGluZ3Mgb2Ygc3RhY2ssIElEVCwgYW5kIFRTUyBhcmUgYmVp
bmcgY2xvbmVkIGZyb20gdGhlIGRpcmVjdCBtYXAKPj4gaW50byBwZXItQ1BVIHBhZ2UgdGFibGVz
Lgo+Cj4gQ2FuIHRoaXMgYmUgdXNlZCB3aXRoIENvbWV0L1ZpeGVuIHRvIGZ1cnRoZXIgcHJvdGVj
dCBQViBndWVzdHM/IGkuZS4KPiBpZiB0aGUgc2hpbSBoeXBlcnZpc29yIGhhcyB0aGVzZSBjaGFu
Z2VzIHRoZW4gd2lsbCBpdCBhbHNvIGxpbWl0Cj4gd2hhdCBhIHByb2Nlc3MgaW4gdGhlIFBWIGd1
ZXN0IGNhbiBzZWUgaW4gdGhhdCBzaGltIGh5cGVydmlzb3IsCj4gd2hpY2ggdGhlcmVmb3JlIHBy
b3RlY3RzIGl0cyBvd24gZ3Vlc3Qga2VybmVsIGEgYml0IHRvbz8KClRlY2huaWNhbGx5LCB5ZXMs
IGl0IHNob3VsZC4KCkhvd2V2ZXIsCiAxKSBJdCBzaG91bGQgYmUgdW5uZWNlc3NhcnkuICBJZiB5
b3UncmUgcnVubmluZyBQViB3aXRoIHRoZQoiYmFuZGFpZCIsIHlvdSBzaG91bGQgYmUgcmVhc29u
YWJseSBzYWZlIHdpdGhvdXQgdXNpbmcgdGhlIHNoaW0KIDIpIFRoZSBzaGltIGFkZHMgbmVhcmx5
IDQwJSBvdmVyaGVhZCBpbiBteSB3b3Jkcy1jYXNlIHRlc3RzOyBhbmQgc28KZG9lcyB0aGUgYmFu
ZGFpZC4gIFRvZ2V0aGVyIEkgdGhpbmsgeW91ciBwZXJmb3JtYW5jZSB3b3VsZCBiZSBwcmV0dHkK
dGVycmlibGUuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
