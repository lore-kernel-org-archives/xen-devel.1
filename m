From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] libxl: make vkbd tunable for HVM guests
Date: Wed, 15 May 2019 10:49:58 +0100
Message-ID: <3b441efd-c459-eee5-12c9-6c749fc18689@citrix.com>
References: <20190514084325.43928-1-elnikety@amazon.com>
 <20190515094711.GM2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rumq=TP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQqY0-0002MJ-WB
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:50:05 +0000
In-Reply-To: <20190515094711.GM2798@zion.uk.xensource.com>
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

T24gMTUvMDUvMjAxOSAxMDo0NywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIE1heSAxNCwgMjAx
OSBhdCAwODo0MzoyNUFNICswMDAwLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4gRWFjaCBIVk0g
Z3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2JhY2tlbmQgcGFpciAoYy9zIGVi
YmQyNTYxYjRjKS4KPj4gVGhpcyBjb25zdW1lcyBob3N0IHJlc291cmNlcyB1bm5lY2Vzc2FyaWx5
IGZvciBndWVzdHMgdGhhdCBoYXZlIG5vIHVzZSBmb3IKPj4gdmtiZC4gTWFrZSB0aGlzIGJlaGF2
aW91ciB0dW5hYmxlIHRvIGFsbG93IGFuIGFkbWluaXN0cmF0b3IgdG8gY2hvb3NlLiBUaGUKPj4g
Y29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0tIEhWTSBndWVzdHMgc3RpbGwg
Z2V0IHZrZGIgdW5sZXNzCj4+IHNwZWNpZmllZCBvdGhlcndpc2UuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6b24uY29tPgo+PiAtLS0KPj4gICAgIENo
YW5nZXMgaW4gdjI6Cj4+ICAgICAgICAgLSBBZGRlZCBhIG1pc3NpbmcgaHVuayAvIHNldHRpbmcg
dmtiX2RldmljZSBwZXIgY29uZmlnCj4+Cj4+ICAgICBDaGFuZ2VzIGluIHYzOgo+PiAgICAgICAg
IC0gQWRkZWQgZW50cmllcyBpbiBsaWJ4bC5oIGFuZCBpbiBkb2N1bWVudGF0aW9uCj4+IC0tLQo+
PiAgZG9jcy9tYW4veGwuY2ZnLnBvZC41LmluICAgIHwgNCArKysrCj4gSSB3b25kZXIgd2hlcmUg
eW91IGdvdCB0aGlzIGZpbGUuIDpwCj4KPiBUaGUgY29ycmVjdCBmaWxlIG5hbWUgaXMgeGwuY2Zn
LjUucG9kLmluLgoKSSByZXZlcnNlZCB0aGUgLnBvZCBhbmQgLjUgaW4gODQxMGZjYjU0YWM4MDhj
MTlhMDMwYzZmMGVjNjRlNzYwYWM2NGNhNQoKVGhpcyBpcyBsaWtlbHkgYSBwYXRjaCBhZ2FpbnN0
IDQuMTEgb3IgZWFybGllci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
