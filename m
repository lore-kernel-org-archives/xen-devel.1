From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] x86: respect memory size limiting via
 mem= parameter
Date: Wed, 23 Jan 2019 15:39:11 +0100
Message-ID: <222a2429-957c-c6cd-3f46-06a627bbbd5e__42269.1825822525$1548254414$gmane$org@suse.com>
References: <20190122080628.7238-1-jgross@suse.com>
 <20190122080628.7238-2-jgross@suse.com>
 <69D0866F-77A7-4529-A01E-12395106E22D@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l+rE=P7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gmJgR-0002OL-51
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 14:39:15 +0000
In-Reply-To: <69D0866F-77A7-4529-A01E-12395106E22D@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: William Kucharski <william.kucharski@oracle.com>
Cc: sstabellini@kernel.org, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOSAxNTozNSwgV2lsbGlhbSBLdWNoYXJza2kgd3JvdGU6Cj4gCj4gCj4+IE9u
IEphbiAyMiwgMjAxOSwgYXQgMTowNiBBTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToKPj4KPj4gZGlmZiAtLWdpdCBhL21tL21lbW9yeV9ob3RwbHVnLmMgYi9tbS9tZW1v
cnlfaG90cGx1Zy5jCj4+IGluZGV4IGI5YTY2N2QzNmM1NS4uN2ZjMmE4NzExMGEzIDEwMDY0NAo+
PiAtLS0gYS9tbS9tZW1vcnlfaG90cGx1Zy5jCj4+ICsrKyBiL21tL21lbW9yeV9ob3RwbHVnLmMK
Pj4gQEAgLTk2LDEwICs5NiwxNiBAQCB2b2lkIG1lbV9ob3RwbHVnX2RvbmUodm9pZCkKPj4gCWNw
dXNfcmVhZF91bmxvY2soKTsKPj4gfQo+Pgo+PiArdTY0IG1heF9tZW1fc2l6ZSA9IC0xOwo+IAo+
IFRoaXMgbWF5IGJlIHBlZGFudGljLCBidXQgSSdkIHJhdGhlciBzZWUgVTY0X01BWCB1c2VkIGhl
cmUuCgpGaW5lIHdpdGggbWUuIFdpbGwgY2hhbmdlLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
