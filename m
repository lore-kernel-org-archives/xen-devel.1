From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Wed, 10 Oct 2018 13:01:19 +0200
Message-ID: <20181010110119.GA20952__22261.5032493652$1539169207$gmane$org@techadventures.net>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <20181010080724.GA20338@techadventures.net>
 <f18b87a0762c4379b78e9b5e09ff4840@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qmy3=mw=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1gACF1-0005Al-Pl
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 11:01:23 +0000
Received: by mail-wm1-f45.google.com with SMTP id z25-v6so13144841wmf.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Oct 2018 04:01:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <f18b87a0762c4379b78e9b5e09ff4840@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: mhocko@suse.com, vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMTAsIDIwMTggYXQgMDQ6MjE6MTZQTSArMDUzMCwgQXJ1biBLUyB3cm90ZToK
PiBkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5X2hvdHBsdWcuYyBiL21tL21lbW9yeV9ob3RwbHVnLmMK
PiBpbmRleCBlMzc5ZTg1Li4yNDE2MTM2IDEwMDY0NAo+IC0tLSBhL21tL21lbW9yeV9ob3RwbHVn
LmMKPiArKysgYi9tbS9tZW1vcnlfaG90cGx1Zy5jCj4gQEAgLTY5MCw5ICs2OTAsMTMgQEAgc3Rh
dGljIGludCBvbmxpbmVfcGFnZXNfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydF9wZm4sCj4gdW5z
aWduZWQgbG9uZyBucl9wYWdlcywKPiAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICphcmcp
Cj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgb25saW5lZF9wYWdlcyA9ICoodW5zaWduZWQg
bG9uZyAqKWFyZzsKPiArICAgICAgIHU2NCB0MSwgdDI7Cj4gCj4gKyAgICAgICB0MSA9IGxvY2Fs
X2Nsb2NrKCk7Cj4gICAgICAgICBpZiAoUGFnZVJlc2VydmVkKHBmbl90b19wYWdlKHN0YXJ0X3Bm
bikpKQo+ICAgICAgICAgICAgICAgICBvbmxpbmVkX3BhZ2VzID0gb25saW5lX3BhZ2VzX2Jsb2Nr
cyhzdGFydF9wZm4sIG5yX3BhZ2VzKTsKPiArICAgICAgIHQyID0gbG9jYWxfY2xvY2soKTsKPiAr
ICAgICAgIHRyYWNlX3ByaW50aygidGltZSBzcGVuZCA9ICVsbHUgdXNcbiIsICh0Mi10MSkvKDEw
MDApKTsKPiAKPiAgICAgICAgIG9ubGluZV9tZW1fc2VjdGlvbnMoc3RhcnRfcGZuLCBzdGFydF9w
Zm4gKyBucl9wYWdlcyk7CgpUaGFua3MgOy0pCiAKCi0tIApPc2NhciBTYWx2YWRvcgpTVVNFIEwz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
