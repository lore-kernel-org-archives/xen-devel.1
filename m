From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: Do not reserve a crash kernel region
 if booted on Xen PV
Date: Wed, 25 Apr 2018 14:53:08 +0200
Message-ID: <a41a685e-7953-0b63-4c85-7af8e346bd02__8854.16317401013$1524660712$gmane$org@suse.com>
References: <20180425120835.23cef60c@ezekiel.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ddll=ho=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fBJv7-0002Ht-CW
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 12:53:13 +0000
In-Reply-To: <20180425120835.23cef60c@ezekiel.suse.cz>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petr Tesarik <ptesarik@suse.cz>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@suse.de>, Andy Lutomirski <luto@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Jean Delvare <jdelvare@suse.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMTggMTI6MDgsIFBldHIgVGVzYXJpayB3cm90ZToKPiBYZW4gUFYgZG9tYWlucyBj
YW5ub3Qgc2h1dCBkb3duIGFuZCBzdGFydCBhIGNyYXNoIGtlcm5lbC4gSW5zdGVhZCwKPiB0aGUg
Y3Jhc2hpbmcga2VybmVsIG1ha2VzIGEgU0NIRURPUF9zaHV0ZG93biBoeXBlcmNhbGwgd2l0aCB0
aGUKPiByZWFzb24gY29kZSBTSFVURE9XTl9jcmFzaCwgY2YuIHhlbl9jcmFzaF9zaHV0ZG93bigp
IG1hY2hpbmUgb3AgaW4KPiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMuCj4gCj4gQSBjcmFz
aCBrZXJuZWwgcmVzZXJ2YXRpb24gaXMgbWVyZWx5IGEgd2FzdGUgb2YgUkFNIGluIHRoaXMgY2Fz
ZS4gSXQKPiBtYXkgYWxzbyBjb25mdXNlIHVzZXJzIG9mIGtleGVjX2xvYWQoMikgYW5kL29yIGtl
eGVjX2ZpbGVfbG9hZCgyKS4KPiBXaGVuIGZsYWdzIGluY2x1ZGUgS0VYRUNfT05fQ1JBU0ggb3Ig
S0VYRUNfRklMRV9PTl9DUkFTSCwKPiByZXNwZWN0aXZlbHksIHRoZXNlIHN5c2NhbGxzIHJldHVy
biBzdWNjZXNzLCB3aGljaCBpcyB0ZWNobmljYWxseQo+IGNvcnJlY3QsIGJ1dCB0aGUgY3Jhc2gg
a2V4ZWMgaW1hZ2Ugd2lsbCBuZXZlciBiZSBhY3R1YWxseSB1c2VkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBldHIgVGVzYXJpayA8cHRlc2FyaWtAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
