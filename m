From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Mon, 16 Apr 2018 10:11:54 +0200
Message-ID: <49e13c53-718f-879c-fc0d-b0f5dd7ea23d__25931.0755217031$1523866255$gmane$org@suse.com>
References: <20180413221146.28476-1-labbott@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=dujn=hf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f7zF0-0002KF-EW
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 08:11:58 +0000
In-Reply-To: <20180413221146.28476-1-labbott@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laura Abbott <labbott@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDQvMTggMDA6MTEsIExhdXJhIEFiYm90dCB3cm90ZToKPiBUaGVyZSdzIGFuIG9uZ29p
bmcgZWZmb3J0IHRvIHJlbW92ZSBWTEFzWzFdIGZyb20gdGhlIGtlcm5lbCB0byBldmVudHVhbGx5
Cj4gdHVybiBvbiAtV3ZsYS4gVGhlIGZldyBWTEFzIGluIHVzZSBoYXZlIGFuIHVwcGVyIGJvdW5k
IGJhc2VkIG9uIGEgc2l6ZQo+IG9mIDY0Sy4gVGhpcyBkb2Vzbid0IHByb2R1Y2UgYW4gZXhjZXNz
aXZlbHkgbGFyZ2Ugc3RhY2sgc28ganVzdCBzd2l0Y2gKPiB0aGUgdXBwZXIgYm91bmQuCj4gCj4g
WzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzMvNy82MjEKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
