From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2] x86/entry/64: Remove %ebx handling from
 error_entry/exit
Date: Tue, 21 Aug 2018 18:42:56 -0700
Message-ID: <CALCETrUs2BYr883a9mMmxuPeTrzbpMfd=V3=guYKn6R5it6ORw__30606.4108307057$1534902149$gmane$org@mail.gmail.com>
References: <1534479596-7546-1-git-send-email-srn@prgmr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ihbd=lf=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1fsIB7-0001Ph-K0
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 01:43:21 +0000
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AFE021840
 for <xen-devel@lists.xenproject.org>; Wed, 22 Aug 2018 01:43:18 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z96-v6so228607wrb.8
 for <xen-devel@lists.xenproject.org>; Tue, 21 Aug 2018 18:43:18 -0700 (PDT)
In-Reply-To: <1534479596-7546-1-git-send-email-srn@prgmr.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sarah Newman <srn@prgmr.com>
Cc: Juergen Gross <jgross@suse.com>, Brian Gerst <brgerst@gmail.com>, X86 ML <x86@kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, stable <stable@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgOToxOSBQTSwgU2FyYWggTmV3bWFuIDxzcm5AcHJnbXIu
Y29tPiB3cm90ZToKPiBjb21taXQgYjM2ODFkZDU0OGQwNmRlYjJlMTU3Mzg5MDgyOWRmZjRiMTVh
YmY0NiB1cHN0cmVhbS4KPgo+IFRoaXMgdmVyc2lvbiBhcHBsaWVzIHRvIHY0LjkuCgouLi4KCkxv
b2tzIG9rYXkgdG8gbWUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
