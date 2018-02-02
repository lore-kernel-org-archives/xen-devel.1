From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86/xen: init %gs very early to avoid
 page faults with stack protector
Date: Fri, 2 Feb 2018 06:56:24 +0100
Message-ID: <3a4fa32b-7909-9fa6-4b6c-71d6b51ad35d__21789.2768480398$1517563894$gmane$org@suse.com>
References: <20180201124019.11693-1-jgross@suse.com>
 <b8f04374-97f1-76d5-81b5-3583441833f4@oracle.com>
 <CABZSBQcmKBGZ2-i-YRL=Ux6hcAP0peR1zfaVh4Go9vr=JTRThQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=jhnk=e4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ehXhx-0002f7-9Z
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 09:32:33 +0000
In-Reply-To: <CABZSBQcmKBGZ2-i-YRL=Ux6hcAP0peR1zfaVh4Go9vr=JTRThQ@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chris Patterson <cjp256@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDIvMTggMDE6MzYsIENocmlzIFBhdHRlcnNvbiB3cm90ZToKPiBXb3JrcyBncmVhdCwg
dGVzdGVkIGl0IGFuZCBpdCBmaXhlcyBib290aW5nIExpbnV4IHY0LjE1IGtlcm5lbCBmb3IgbWUg
OikKCkNhbiBJIGFkZCB5b3VyICJUZXN0ZWQtYnk6IiB0byB0aGUgcGF0Y2ggd2hlbiBjb21taXR0
aW5nIGl0PwoKCkp1ZXJnZW4KCj4gCj4gQ2hlZXJzIQo+IAo+IE9uIFRodSwgRmViIDEsIDIwMTgg
YXQgMzoxNyBQTSwgQm9yaXMgT3N0cm92c2t5Cj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
PiB3cm90ZToKPj4gT24gMDIvMDEvMjAxOCAwNzo0MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+IFdoZW4gcnVubmluZyBhcyBYZW4gcHYgZ3Vlc3QgJWdzIGlzIGluaXRpYWxpemVkIHNvbWUg
dGltZSBhZnRlcgo+Pj4gQyBjb2RlIGlzIHN0YXJ0ZWQuIERlcGVuZGluZyBvbiBzdGFjayBwcm90
ZWN0b3IgdXNhZ2UgdGhpcyBtaWdodCBiZQo+Pj4gdG9vIGxhdGUsIHJlc3VsdGluZyBpbiBwYWdl
IGZhdWx0cy4KPj4+Cj4+PiBTbyBzZXR1cCAlZ3MgYW5kIE1TUl9HU19CQVNFIGluIGFzc2VtYmx5
IGNvZGUgYWxyZWFkeS4KPj4+Cj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+Pj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+PiBSZXZpZXdl
ZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4KPj4K
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
WGVuLWRldmVsIG1haWxpbmcgbGlzdAo+PiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
