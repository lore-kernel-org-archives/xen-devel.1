From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] xen: Fix x86 sched_clock() interface for
 xen
Date: Fri, 11 Jan 2019 15:35:54 -0500
Message-ID: <f0b7963a-049f-e89e-a9cb-9e0f18f771a3__45067.9964189932$1547238906$gmane$org@oracle.com>
References: <20190111120805.24852-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w36A=PT=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gi3XS-0002fo-IE
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 20:36:22 +0000
In-Reply-To: <20190111120805.24852-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org, hans@knorrie.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMS8xMS8xOSA3OjA4IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IEBAIC00MjEsNiArNDI0
LDExIEBAIHZvaWQgeGVuX3Jlc3RvcmVfdGltZV9tZW1vcnlfYXJlYSh2b2lkKQo+ICAJaWYgKHJl
dCAhPSAwKQo+ICAJCXByX25vdGljZSgiQ2Fubm90IHJlc3RvcmUgc2Vjb25kYXJ5IHZjcHVfdGlt
ZV9pbmZvIChlcnIgJWQpIiwKPiAgCQkJICByZXQpOwo+ICsKPiArb3V0Ogo+ICsJLyogTmVlZCBw
dmNsb2NrX3Jlc3VtZSgpIGJlZm9yZSB1c2luZyB4ZW5fY2xvY2tzb3VyY2VfcmVhZCgpLiAqLwo+
ICsJcHZjbG9ja19yZXN1bWUoKTsKCkRvIHdlIHdhbnQgdG8gZHJvcCBpdCBmcm9tIHhlbl90aW1l
cl9yZXN1bWUgdGhlbj8KCkJUVywgSSByYW4gdGhpcyBjb2RlIGEgZmV3IHRpbWVzIG9uIHRvcCBv
ZiBmb3ItbGludXMtNC4yMSBhbmQgZGlkbid0IHNlZQphbnkgb2YgdGhlIHByb2JsZW1zIHRoYXQg
SGFucyBkZXNjcmliZWQuIEkgZGlkbid0IGRvIExNLCBvbmx5CnNhdmUvcmVzdG9yZSwgYnV0IEkn
ZCB0aGluayBpdCBzaG91bGRuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZS4KCi1ib3JpcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
