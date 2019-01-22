From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH] gic: drop interrupts enabling on interrupts
 processing
Date: Tue, 22 Jan 2019 15:12:56 +0200
Message-ID: <06ba4538-5742-227a-4a49-812441d3cefb@gmail.com>
References: <1545414089-12024-1-git-send-email-andrii.anisov@gmail.com>
 <7ec571de-e1ed-93bd-87ef-759d315564d2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqM6=P6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glvrR-00073v-4R
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 13:13:01 +0000
Received: by mail-lf1-x142.google.com with SMTP id e26so18036070lfc.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jan 2019 05:12:59 -0800 (PST)
In-Reply-To: <7ec571de-e1ed-93bd-87ef-759d315564d2@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjEuMDEuMTkgMTk6MzksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
IHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8ga2VlcCB0aGUgaW50ZXJydXB0cyBkaXNhYmxl
ZCBpbiBpc19scGkgYXMgd2VsbC4gU28gd2Uga2VlcCB0aGUgYmVoYXZpb3IgdGhlIHNhbWUgYWNj
cm9zcyBhbGwgaW50ZXJydXB0cy4KQWdyZWUuCldpbGwgc2VuZCB2MiBhIGJpdCBsYXRlci4KCi0t
IApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
