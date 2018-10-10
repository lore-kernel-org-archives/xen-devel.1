From: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] xen: make xen_qlock_wait() nestable
Date: Wed, 10 Oct 2018 13:53:08 -0000
Message-ID: <cb5493536af5bf3064bf568fa107bcf0.squirrel__2118.02772614664$1539179532$gmane$org@twosheds.infradead.org>
References: <20181001071641.19282-1-jgross@suse.com>
 <20181001071641.19282-3-jgross@suse.com>
 <47686a61dfc06aa5afb05a893b9a56e6eb46763d.camel@infradead.org>
 <alpine.DEB.2.21.1810101426080.10278@nanos.tec.linutronix.de>
 <eb9250d00cf9095913a7ecc3a2c575b9ed40fd6f.camel@infradead.org>
 <alpine.DEB.2.21.1810101445530.10278@nanos.tec.linutronix.de>
 <35f0d72b-c4b9-3557-6348-25a8646c6995@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jwnd=mw=twosheds.srs.infradead.org=batv+65859f7e6c2c6a3144ce+5526+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1gAEvN-0004Dp-7p
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 13:53:17 +0000
In-Reply-To: <35f0d72b-c4b9-3557-6348-25a8646c6995@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: waiman.long@hp.com, peterz@infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

Cj4gVGhlIFhlbiBIViBpcyBkb2luZyBpdCByaWdodC4gSXQgaXMgYmxvY2tpbmcgdGhlIHZjcHUg
aW4gZG9fcG9sbCgpIGFuZAo+IGFueSBpbnRlcnJ1cHQgd2lsbCB1bmJsb2NrIGl0LgoKR3JlYXQu
IFRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbi4KCi0tIApkd213MgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
