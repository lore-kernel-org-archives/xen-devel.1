From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: Fix x86 sched_clock() interface for xen
Date: Thu, 10 Jan 2019 12:17:20 -0500
Message-ID: <21d24fe0-f9bd-c312-7773-b43a8ff39ef1__35898.2969927185$1547140599$gmane$org@oracle.com>
References: <20190110100722.11216-1-jgross@suse.com>
 <e7ea12ca-93f1-2421-702b-b55806eb20bd@oracle.com>
 <e98d244f-1257-ed23-26f4-8909900590b4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o8hk=PS=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ghdxd-000349-5x
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 17:17:41 +0000
In-Reply-To: <e98d244f-1257-ed23-26f4-8909900590b4@suse.com>
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

T24gMS8xMC8xOSAxMToxNCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMC8wMS8yMDE5
IDE2OjM0LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDEvMTAvMTkgNTowNyBBTSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4+ICAKPj4+ICt2b2lkIHhlbl9jbG9ja3NvdXJjZV9zdXNwZW5k
KHZvaWQpCj4+PiArewo+Pj4gKwl4ZW5fY2xvY2tfdmFsdWVfc2F2ZWQgPSB4ZW5fY2xvY2tzb3Vy
Y2VfcmVhZCgpIC0geGVuX3NjaGVkX2Nsb2NrX29mZnNldDsKPj4KPj4geGVuX2Nsb2NrX3ZhbHVl
X3NhdmVkID0geGVuX3NjaGVkX2Nsb2NrKCkgbWF5YmU/IAo+IEkgd2FudGVkIHhlbl9jbG9ja3Nv
dXJjZV9zdXNwZW5kKCkgYW5kIHhlbl9jbG9ja3NvdXJjZV9yZXN1bWUoKSB0bwo+IGJlIHN5bW1l
dHJpY2FsIHRvIGVhY2ggb3RoZXIuCgpPSy4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kg
PGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKPgo+IEluIGNhc2UgeW91IGFyZSBmZWVsaW5n
IHN0cm9uZyBhYm91dCB0aGF0LCBJJ20gbm90LiA6LSkgU28gaW4gY2FzZQo+IHlvdSBpbnNpc3Qg
b24gaXQgSSBjYW4gY2hhbmdlIGl0LiBPciB5b3UgY2FuIGRvIHNvIHdoaWxlIGNvbW1pdHRpbmcu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
