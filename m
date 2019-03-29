From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Fri, 29 Mar 2019 09:41:27 +0000
Message-ID: <25c9291b-51dc-e45c-2fc7-b6d6c89f05b8@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
 <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=erL7=SA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9o0y-0005y2-TX
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 09:41:32 +0000
In-Reply-To: <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyOC8wMy8yMDE5IDA5OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNy4w
My4xOSBhdCAxOTo0NSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gQ2xhbmcgdXNl
cyAiLXRhcmdldCIgb3B0aW9uIGZvciBjcm9zcy1jb21waWxhdGlvbi4KPiAKPj4gLS0tIGEvY29u
ZmlnL1N0ZEdOVS5tawo+PiArKysgYi9jb25maWcvU3RkR05VLm1rCj4+IEBAIC0xLDggKzEsMTMg
QEAKPj4gICBBUyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWFzCj4+ICAgTEQgICAgICAgICA9
ICQoQ1JPU1NfQ09NUElMRSlsZAo+PiAgIGlmZXEgKCQoY2xhbmcpLHkpCj4+IC1DQyAgICAgICAg
ID0gJChDUk9TU19DT01QSUxFKWNsYW5nCj4+IC1DWFggICAgICAgID0gJChDUk9TU19DT01QSUxF
KWNsYW5nKysKPj4gK2lmbmVxICgkKENST1NTX0NPTVBJTEUpLCkKPj4gK0NDICAgICAgICAgPSBj
bGFuZyAtdGFyZ2V0ICQoQ1JPU1NfQ09NUElMRTotPSkKPj4gK0NYWCAgICAgICAgPSBjbGFuZysr
IC10YXJnZXQgJChDUk9TU19DT01QSUxFOi09KQo+IAo+IElzIGRyb3BwaW5nIGRhc2hlcyBmcm9t
IHRoZSB2YXJpYWJsZSB1bmlmb3JtbHkgY29ycmVjdD8gSWYgc28sCj4gY291bGQgeW91IHBsZWFz
ZSBjbGFyaWZ5IGluIHRoZSBjb21taXQgbWVzc2FnZSB3aHkgdGhhdCBpcz8KVGhlIHRhcmdldCBv
cHRpb24gcmVxdWlyZXMgdGhlIGZvbGxvd2luZyBmb3JtYXQ6Cgo8YXJjaD48c3ViPi08dmVuZG9y
Pi08c3lzPi08YWJpPgoKSW4gb3RoZXIgcGxhY2VzLCB3ZSBuZWVkIHRoZSB0cmFpbGluZyBkYXNo
IGFzIEdOVSB0b29scyBhcmUgdXNpbmcgdGhlIHNhbWUgCmZvcm1hdCBhcyBhYm92ZSB3aXRoIGEg
ZGFzaCB0byBzZXBhcmF0ZSB0aGUgdG9vbCBuYW1lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
