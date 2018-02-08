From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: Calculate __max_logical_packages
	on PV domains
Date: Thu, 8 Feb 2018 09:49:40 +0100
Message-ID: <0e2775c8-2114-e554-dd0f-7222300e3e27__41855.6360331879$1518079745$gmane$org@suse.com>
References: <20180207234923.13544-1-prarit@redhat.com>
 <5607eaea-5cc3-31a4-9685-1d7dd147f564@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=35gd=fc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ejhtt-00083o-C3
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 08:49:49 +0000
In-Reply-To: <5607eaea-5cc3-31a4-9685-1d7dd147f564@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Cc: Prarit Bhargava <prarit@redhat.com>, Dou Liyang <douly.fnst@cn.fujitsu.com>, Andi Kleen <ak@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, simon@invisiblethingslab.com, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDIvMTggMDE6NTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiAKPiAKPiBPbiAwMi8w
Ny8yMDE4IDA2OjQ5IFBNLCBQcmFyaXQgQmhhcmdhdmEgd3JvdGU6Cj4+IFRoZSBrZXJuZWwgcGFu
aWNzIG9uIFBWIGRvbWFpbnMgYmVjYXVzZSBuYXRpdmVfc21wX2NwdXNfZG9uZSgpIGlzCj4+IG9u
bHkgY2FsbGVkIGZvciBIVk0gZG9tYWlucy4KPj4KPj4gQ2FsY3VsYXRlIF9fbWF4X2xvZ2ljYWxf
cGFja2FnZXMgZm9yIFBWIGRvbWFpbnMuCj4+Cj4+IEZpeGVzOiBiNGMwYTczMjZmNWQgKCJ4ODYv
c21wYm9vdDogRml4IF9fbWF4X2xvZ2ljYWxfcGFja2FnZXMgZXN0aW1hdGUiKQo+PiBTaWduZWQt
b2ZmLWJ5OiBQcmFyaXQgQmhhcmdhdmEgPHByYXJpdEByZWRoYXQuY29tPgo+PiBUZXN0ZWQtYW5k
LXJlcG9ydGVkLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlzaWJsZXRoaW5nc2xhYi5jb20+
Cj4+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPj4gQ2M6IEluZ28g
TW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+PiBDYzogIkguIFBldGVyIEFudmluIiA8aHBhQHp5
dG9yLmNvbT4KPj4gQ2M6IHg4NkBrZXJuZWwub3JnCj4+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+PiBDYzogRG91IExpeWFuZyA8ZG91bHkuZm5zdEBjbi5mdWppdHN1LmNvbT4KPj4g
Q2M6IFByYXJpdCBCaGFyZ2F2YSA8cHJhcml0QHJlZGhhdC5jb20+Cj4+IENjOiBLYXRlIFN0ZXdh
cnQgPGtzdGV3YXJ0QGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+IENjOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiBDYzogQW5keSBMdXRvbWlyc2tpIDxs
dXRvQGtlcm5lbC5vcmc+Cj4+IENjOiBBbmRpIEtsZWVuIDxha0BsaW51eC5pbnRlbC5jb20+Cj4+
IENjOiBWaXRhbHkgS3V6bmV0c292IDx2a3V6bmV0c0ByZWRoYXQuY29tPgo+PiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpUaG9tYXMsIEluZ28sIGFyZSB5b3Ug
dGFraW5nIHRoaXMgdmlhIHRoZSB0aXAgdHJlZSBvciBzaG91bGQgSSB0YWtlCml0IHZpYSB0aGUg
eGVuIHRyZWU/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
