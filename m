From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen: Fix x86 sched_clock() interface for xen
Date: Thu, 10 Jan 2019 10:34:06 -0500
Message-ID: <e7ea12ca-93f1-2421-702b-b55806eb20bd__42245.4736930833$1547134399$gmane$org@oracle.com>
References: <20190110100722.11216-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o8hk=PS=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ghcLt-0002Vi-VX
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 15:34:38 +0000
In-Reply-To: <20190110100722.11216-1-jgross@suse.com>
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

T24gMS8xMC8xOSA1OjA3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ICAKPiArdm9pZCB4ZW5f
Y2xvY2tzb3VyY2Vfc3VzcGVuZCh2b2lkKQo+ICt7Cj4gKwl4ZW5fY2xvY2tfdmFsdWVfc2F2ZWQg
PSB4ZW5fY2xvY2tzb3VyY2VfcmVhZCgpIC0geGVuX3NjaGVkX2Nsb2NrX29mZnNldDsKCgp4ZW5f
Y2xvY2tfdmFsdWVfc2F2ZWQgPSB4ZW5fc2NoZWRfY2xvY2soKSBtYXliZT8gCgotYm9yaXMKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
