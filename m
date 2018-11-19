From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 00/22] QOM'ify SysBusDeviceClass->init
Date: Mon, 19 Nov 2018 13:27:40 +0100
Message-ID: <20181119132740.2e948b4a.cohuck@redhat.com>
References: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2YMm=N6=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1gOif4-0008Bv-Hv
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:28:18 +0000
In-Reply-To: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Cc: peter.maydell@linaro.org, david@redhat.com, qemu-devel@nongnu.org, alistair.francis@wdc.com, kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, sstabellini@kernel.org, qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com, borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com, anthony.perard@citrix.com, marcandre.lureau@redhat.com, rth@twiddle.net, thuth@redhat.com, ehabkost@redhat.com, richard.henderson@linaro.org, chouteau@adacore.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, jan.kiszka@web.de, xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, kwolf@redhat.com, f4bug@amsat.org, mreitz@redhat.com, michael@walle.cc, qemu-ppc@nongnu.org, pbonzini@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOSBOb3YgMjAxOCAyMDowNzo1OCArMDgwMApNYW8gWmhvbmd5aSA8bWFvemhvbmd5
aUBjbXNzLmNoaW5hbW9iaWxlLmNvbT4gd3JvdGU6Cgo+IFRoZSBTeXNCdXNEZXZpY2VDbGFzczo6
aW5pdCgpIGludGVyZmFjZSBpcyBjb25zaWRlcmVkCj4gYXMgYSBsZWdhY3kgaW50ZXJmYWNlIGFu
ZCB0aGVyZSBhcmUgY3VycmVudGx5IHNvbWUKPiBlZmZvcnRzIGdvaW5nIG9uIHRvIGdldCByaWQg
b2YgaXQuIFRodXMgY29udmVydCAKPiBTeXNCdXNEZXZpY2VDbGFzczo6aW5pdCB0byBEZXZpY2VD
bGFzczo6cmVhbGl6ZS4KCkluIGNhc2UgbXkgY29tbWVudCB0byB0aGUgczM5MCBjaGFuZ2UgY29t
ZXMgb2ZmIGFzIG5lZ2F0aXZlOiBJIGxpa2UKZ2V0dGluZyByaWQgb2YgdGhlIGxlZ2FjeSBpbnRl
cmZhY2UgOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
