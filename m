From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Wed, 16 Jan 2019 16:29:31 +0100
Message-ID: <c426f0a5-59bf-2ccb-6afd-39990a9fddac__48661.385526839$1547652492$gmane$org@suse.com>
References: <20190114124413.3742-1-jgross@suse.com>
 <ebfc24e3-21a0-6cc6-ae68-5c13c1e66b9a@knorrie.org>
 <4808225b-e413-2ec1-77a1-15999c18583f@suse.com>
 <20190116131703.GB2793@localhost.localdomain>
 <efaf168e-feca-2c09-96e1-3f58be9853bf@suse.com>
 <71f7d41b-1822-d0b5-a28a-b10172bc5746@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JTqL=PY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjn8I-0002C1-Ku
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 15:29:34 +0000
In-Reply-To: <71f7d41b-1822-d0b5-a28a-b10172bc5746@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Hans van Kranenburg <hans@knorrie.org>, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMjAxOSAxNjowNywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEvMTYvMTkg
OTozMyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTYvMDEvMjAxOSAxNDoxNywgQm9y
aXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDg6NTA6MTNB
TSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Cj4+Pj4gQEAgLTE2NTAsMTMgKzE2NTAs
MTQgQEAgdm9pZCB4ZW5fY2FsbGJhY2tfdmVjdG9yKHZvaWQpCj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgeGVuX2hhdmVfdmVjdG9yX2NhbGxiYWNrID0gMDsKPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm47Cj4+Pj4gICAgICAgICAgICAgICAgIH0KPj4+PiAtICAgICAgICAg
ICAgICAgcHJfaW5mbygiWGVuIEhWTSBjYWxsYmFjayB2ZWN0b3IgZm9yIGV2ZW50IGRlbGl2ZXJ5
IGlzCj4+Pj4gZW5hYmxlZFxuIik7Cj4+Pj4gKyAgICAgICAgICAgICAgIGlmICghc2lsZW50KQo+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHByX2luZm8oIlhlbiBIVk0gY2FsbGJhY2sgdmVj
dG9yIGZvciBldmVudAo+Pj4+IGRlbGl2ZXJ5IGlzIGVuYWJsZWRcbiIpOwo+Pj4gSG93IGFib3V0
IHJlcGxhY2luZyBwcl9pbmZvKCkgd2l0aCBwcl9pbmZvX29uY2UoKT8KPj4gV2hhdCBhIG5pY2Ug
YW5kIHNpbXBsZSBpZGVhIQo+Pgo+PiBFeHRyYSBwYXRjaCBvciBWND8KPj4KPiAKPiAKPiBJIGNh
biBhZGQgdGhpcyB3aGlsZSBjb21taXR0aW5nLCBJIGRvbid0IHRoaW5rIGl0J3Mgd29ydGggYSB3
aG9sZSBuZXcgcGF0Y2guCj4gCj4gT25lIG91dHN0YW5kaW5nIHF1ZXN0aW9uIEkgaGF2ZSBpcyB3
aGV0aGVyIGFueXRoaW5nIG5lZWRzIHRvIGJlIGFkZGVkIHRvCj4gdGhlIGNvbW1pdCBtZXNzYWdl
IChUaG9tYXMgaGFkIHNvbWUgcXVlc3Rpb25zKQoKSGUgZGlkbid0IHJlYWN0IHRvIG15IGV4cGxh
bmF0aW9uLiBJJ20gaW50ZXJwcmV0aW5nIHRoYXQgYXMgaGltIGJlaW5nCmZpbmUgd2l0aCBteSBl
eHBsYW5hdGlvbiwgd2hpY2ggSSBiZWxpZXZlIGlzIG5vdCBzdWl0YWJsZSB0byBiZSBhZGRlZAp0
byB0aGUgY29tbWl0IG1lc3NhZ2UuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
