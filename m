From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Wed, 16 Jan 2019 15:33:24 +0100
Message-ID: <efaf168e-feca-2c09-96e1-3f58be9853bf__23082.3785918348$1547649128$gmane$org@suse.com>
References: <20190114124413.3742-1-jgross@suse.com>
 <ebfc24e3-21a0-6cc6-ae68-5c13c1e66b9a@knorrie.org>
 <4808225b-e413-2ec1-77a1-15999c18583f@suse.com>
 <20190116131703.GB2793@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JTqL=PY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjmG1-0004rL-HX
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 14:33:29 +0000
In-Reply-To: <20190116131703.GB2793@localhost.localdomain>
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

T24gMTYvMDEvMjAxOSAxNDoxNywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIFdlZCwgSmFu
IDE2LCAyMDE5IGF0IDA4OjUwOjEzQU0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gCj4+
IEBAIC0xNjUwLDEzICsxNjUwLDE0IEBAIHZvaWQgeGVuX2NhbGxiYWNrX3ZlY3Rvcih2b2lkKQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5faGF2ZV92ZWN0b3JfY2FsbGJhY2sgPSAwOwo+
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4+ICAgICAgICAgICAgICAgICB9Cj4+
IC0gICAgICAgICAgICAgICBwcl9pbmZvKCJYZW4gSFZNIGNhbGxiYWNrIHZlY3RvciBmb3IgZXZl
bnQgZGVsaXZlcnkgaXMKPj4gZW5hYmxlZFxuIik7Cj4+ICsgICAgICAgICAgICAgICBpZiAoIXNp
bGVudCkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfaW5mbygiWGVuIEhWTSBjYWxsYmFj
ayB2ZWN0b3IgZm9yIGV2ZW50Cj4+IGRlbGl2ZXJ5IGlzIGVuYWJsZWRcbiIpOwo+IAo+IEhvdyBh
Ym91dCByZXBsYWNpbmcgcHJfaW5mbygpIHdpdGggcHJfaW5mb19vbmNlKCk/CgpXaGF0IGEgbmlj
ZSBhbmQgc2ltcGxlIGlkZWEhCgpFeHRyYSBwYXRjaCBvciBWND8KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
