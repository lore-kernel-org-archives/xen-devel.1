From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Fix x86 sched_clock() interface for xen
Date: Thu, 10 Jan 2019 17:14:53 +0100
Message-ID: <e98d244f-1257-ed23-26f4-8909900590b4__8724.44139463386$1547136826$gmane$org@suse.com>
References: <20190110100722.11216-1-jgross@suse.com>
 <e7ea12ca-93f1-2421-702b-b55806eb20bd@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aJy4=PS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ghcyv-0006VY-9D
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 16:14:57 +0000
In-Reply-To: <e7ea12ca-93f1-2421-702b-b55806eb20bd@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org, hans@knorrie.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDEvMjAxOSAxNjozNCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEvMTAvMTkg
NTowNyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gIAo+PiArdm9pZCB4ZW5fY2xvY2tzb3Vy
Y2Vfc3VzcGVuZCh2b2lkKQo+PiArewo+PiArCXhlbl9jbG9ja192YWx1ZV9zYXZlZCA9IHhlbl9j
bG9ja3NvdXJjZV9yZWFkKCkgLSB4ZW5fc2NoZWRfY2xvY2tfb2Zmc2V0Owo+IAo+IAo+IHhlbl9j
bG9ja192YWx1ZV9zYXZlZCA9IHhlbl9zY2hlZF9jbG9jaygpIG1heWJlPyAKCkkgd2FudGVkIHhl
bl9jbG9ja3NvdXJjZV9zdXNwZW5kKCkgYW5kIHhlbl9jbG9ja3NvdXJjZV9yZXN1bWUoKSB0bwpi
ZSBzeW1tZXRyaWNhbCB0byBlYWNoIG90aGVyLgoKSW4gY2FzZSB5b3UgYXJlIGZlZWxpbmcgc3Ry
b25nIGFib3V0IHRoYXQsIEknbSBub3QuIDotKSBTbyBpbiBjYXNlCnlvdSBpbnNpc3Qgb24gaXQg
SSBjYW4gY2hhbmdlIGl0LiBPciB5b3UgY2FuIGRvIHNvIHdoaWxlIGNvbW1pdHRpbmcuCgoKSnVl
cmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
