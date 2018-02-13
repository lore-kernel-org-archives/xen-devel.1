From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] x86/xen: Calculate __max_logical_packages
	on PV domains
Date: Tue, 13 Feb 2018 13:29:20 +0100
Message-ID: <20180213122920.4afcvqqxcstbftan@gmail.com>
References: <20180207234923.13544-1-prarit@redhat.com>
 <5607eaea-5cc3-31a4-9685-1d7dd147f564@oracle.com>
 <0e2775c8-2114-e554-dd0f-7222300e3e27@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=x7fr=fh=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1elZiA-0008Fx-N8
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 12:29:26 +0000
Received: by mail-wr0-x243.google.com with SMTP id k9so4662482wre.9
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2018 04:29:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <0e2775c8-2114-e554-dd0f-7222300e3e27@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Prarit Bhargava <prarit@redhat.com>, Dou Liyang <douly.fnst@cn.fujitsu.com>, Andi Kleen <ak@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, linux-kernel@vger.kernel.org, simon@invisiblethingslab.com, Vitaly Kuznetsov <vkuznets@redhat.com>, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>
List-Id: xen-devel@lists.xenproject.org

CiogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKCj4gT24gMDgvMDIvMTgg
MDE6NTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAwMi8wNy8yMDE4
IDA2OjQ5IFBNLCBQcmFyaXQgQmhhcmdhdmEgd3JvdGU6Cj4gPj4gVGhlIGtlcm5lbCBwYW5pY3Mg
b24gUFYgZG9tYWlucyBiZWNhdXNlIG5hdGl2ZV9zbXBfY3B1c19kb25lKCkgaXMKPiA+PiBvbmx5
IGNhbGxlZCBmb3IgSFZNIGRvbWFpbnMuCj4gPj4KPiA+PiBDYWxjdWxhdGUgX19tYXhfbG9naWNh
bF9wYWNrYWdlcyBmb3IgUFYgZG9tYWlucy4KPiA+Pgo+ID4+IEZpeGVzOiBiNGMwYTczMjZmNWQg
KCJ4ODYvc21wYm9vdDogRml4IF9fbWF4X2xvZ2ljYWxfcGFja2FnZXMgZXN0aW1hdGUiKQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFByYXJpdCBCaGFyZ2F2YSA8cHJhcml0QHJlZGhhdC5jb20+Cj4gPj4g
VGVzdGVkLWFuZC1yZXBvcnRlZC1ieTogU2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0aGlu
Z3NsYWIuY29tPgo+ID4+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4K
PiA+PiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4gPj4gQ2M6ICJILiBQZXRl
ciBBbnZpbiIgPGhwYUB6eXRvci5jb20+Cj4gPj4gQ2M6IHg4NkBrZXJuZWwub3JnCj4gPj4gQ2M6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gPj4gQ2M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+PiBDYzogRG91IExpeWFuZyA8ZG91bHku
Zm5zdEBjbi5mdWppdHN1LmNvbT4KPiA+PiBDYzogUHJhcml0IEJoYXJnYXZhIDxwcmFyaXRAcmVk
aGF0LmNvbT4KPiA+PiBDYzogS2F0ZSBTdGV3YXJ0IDxrc3Rld2FydEBsaW51eGZvdW5kYXRpb24u
b3JnPgo+ID4+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgo+ID4+IENjOiBBbmR5IEx1dG9taXJza2kgPGx1dG9Aa2VybmVsLm9yZz4KPiA+PiBDYzog
QW5kaSBLbGVlbiA8YWtAbGludXguaW50ZWwuY29tPgo+ID4+IENjOiBWaXRhbHkgS3V6bmV0c292
IDx2a3V6bmV0c0ByZWRoYXQuY29tPgo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKPiA+IAo+ID4gCj4gPiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiAKPiBUaG9tYXMsIEluZ28sIGFyZSB5b3UgdGFraW5nIHRo
aXMgdmlhIHRoZSB0aXAgdHJlZSBvciBzaG91bGQgSSB0YWtlCj4gaXQgdmlhIHRoZSB4ZW4gdHJl
ZT8KClNpbmNlIGl0J3Mgc3VwcG9zZWQgdG8gb25seSBhZmZlY3QgWGVuIGZlZWwgZnJlZSB0byBw
aWNrIGl0IHVwOgoKICBBY2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+CgpU
aGFua3MsCgoJSW5nbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
