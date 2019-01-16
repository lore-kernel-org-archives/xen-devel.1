From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Wed, 16 Jan 2019 10:07:54 -0500
Message-ID: <71f7d41b-1822-d0b5-a28a-b10172bc5746__31280.4516092458$1547651221$gmane$org@oracle.com>
References: <20190114124413.3742-1-jgross@suse.com>
 <ebfc24e3-21a0-6cc6-ae68-5c13c1e66b9a@knorrie.org>
 <4808225b-e413-2ec1-77a1-15999c18583f@suse.com>
 <20190116131703.GB2793@localhost.localdomain>
 <efaf168e-feca-2c09-96e1-3f58be9853bf@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HFAl=PY=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gjmne-0007uK-KM
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 15:08:14 +0000
In-Reply-To: <efaf168e-feca-2c09-96e1-3f58be9853bf@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Hans van Kranenburg <hans@knorrie.org>, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNi8xOSA5OjMzIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDE2LzAxLzIwMTkg
MTQ6MTcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gV2VkLCBKYW4gMTYsIDIwMTkgYXQg
MDg6NTA6MTNBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4KPj4+IEBAIC0xNjUwLDEz
ICsxNjUwLDE0IEBAIHZvaWQgeGVuX2NhbGxiYWNrX3ZlY3Rvcih2b2lkKQo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgeGVuX2hhdmVfdmVjdG9yX2NhbGxiYWNrID0gMDsKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybjsKPj4+ICAgICAgICAgICAgICAgICB9Cj4+PiAtICAgICAg
ICAgICAgICAgcHJfaW5mbygiWGVuIEhWTSBjYWxsYmFjayB2ZWN0b3IgZm9yIGV2ZW50IGRlbGl2
ZXJ5IGlzCj4+PiBlbmFibGVkXG4iKTsKPj4+ICsgICAgICAgICAgICAgICBpZiAoIXNpbGVudCkK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHByX2luZm8oIlhlbiBIVk0gY2FsbGJhY2sgdmVj
dG9yIGZvciBldmVudAo+Pj4gZGVsaXZlcnkgaXMgZW5hYmxlZFxuIik7Cj4+IEhvdyBhYm91dCBy
ZXBsYWNpbmcgcHJfaW5mbygpIHdpdGggcHJfaW5mb19vbmNlKCk/Cj4gV2hhdCBhIG5pY2UgYW5k
IHNpbXBsZSBpZGVhIQo+Cj4gRXh0cmEgcGF0Y2ggb3IgVjQ/Cj4KCgpJIGNhbiBhZGQgdGhpcyB3
aGlsZSBjb21taXR0aW5nLCBJIGRvbid0IHRoaW5rIGl0J3Mgd29ydGggYSB3aG9sZSBuZXcgcGF0
Y2guCgpPbmUgb3V0c3RhbmRpbmcgcXVlc3Rpb24gSSBoYXZlIGlzIHdoZXRoZXIgYW55dGhpbmcg
bmVlZHMgdG8gYmUgYWRkZWQgdG8KdGhlIGNvbW1pdCBtZXNzYWdlIChUaG9tYXMgaGFkIHNvbWUg
cXVlc3Rpb25zKQoKCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
