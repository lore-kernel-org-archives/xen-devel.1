From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] x86-64/Xen: fix stack switching
Date: Wed, 16 Jan 2019 12:51:20 +0100
Message-ID: <87b0cc15-0e62-db9e-391d-77b42a2626b1__1023.71434118158$1547639471$gmane$org@suse.com>
References: <5AF03EBD02000078001C1303@suse.com>
 <5AF03EBD02000000000F91D6@suse.com> <5AF03EBD02000078001FE590@suse.com>
 <5C3E1128020000780020DFAD@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JTqL=PY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjjk6-0004X9-PV
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 11:52:22 +0000
In-Reply-To: <5C3E1128020000780020DFAD@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, lkml <linux-kernel@vger.kernel.org>, Andrew Lutomirski <luto@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxNzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgaW4gdGhlIG5h
dGl2ZSBjYXNlIGVudHJ5IGludG8gdGhlIGtlcm5lbCBoYXBwZW5zIG9uIHRoZSB0cmFtcG9saW5l
Cj4gc3RhY2ssIFBWIFhlbiBrZXJuZWxzIGdldCBlbnRlcmVkIHdpdGggdGhlIGN1cnJlbnQgdGhy
ZWFkIHN0YWNrIHJpZ2h0Cj4gYXdheS4gSGVuY2Ugc291cmNlIGFuZCBkZXN0aW5hdGlvbiBzdGFj
a3MgYXJlIGlkZW50aWNhbCBpbiB0aGF0IGNhc2UsCj4gYW5kIHNwZWNpYWwgY2FyZSBpcyBuZWVk
ZWQuCj4gCj4gT3RoZXIgdGhhbiBpbiBzeW5jX3JlZ3MoKSB0aGUgY29weWluZyBkb25lIG9uIHRo
ZSBJTlQ4MCBwYXRoIGlzbid0Cj4gTk1JIC8gI01DIHNhZmUsIGFzIGVpdGhlciBvZiB0aGVzZSBl
dmVudHMgb2NjdXJyaW5nIGluIHRoZSBtaWRkbGUgb2YgdGhlCj4gc3RhY2sgY29weWluZyB3b3Vs
ZCBjbG9iYmVyIGRhdGEgb24gdGhlIChzb3VyY2UpIHN0YWNrLgo+IAo+IEknbSBub3QgYWx0ZXJp
bmcgdGhlIHNpbWlsYXIgY29kZSBpbiBpbnRlcnJ1cHRfZW50cnkoKSBhbmQgbm1pKCksIGFzCj4g
dGhvc2UgY29kZSBwYXRocyBhcmUgdW5yZWFjaGFibGUgYWZhaWN0IHdoZW4gcnVubmluZyBQViBY
ZW4gZ3Vlc3RzLgo+IAo+IEZpeGVzOiA3ZjI1OTBhMTEwYjgzN2FmNTY3OWQwOGZjMjVjNjIyN2M1
YThjNDk3Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IENjOiBzdGFibGVAa2VybmVsLm9yZyAKClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
