From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH v3] memory_hotplug: Free pages as higher
 order
Date: Thu, 27 Sep 2018 09:09:58 +0200
Message-ID: <20180927070957.GA19369__36139.368141494$1538032129$gmane$org@techadventures.net>
References: <1538031530-25489-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ymm0=mj=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1g5QR0-00008y-6D
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 07:10:02 +0000
Received: by mail-wm1-f66.google.com with SMTP id y25-v6so4687207wmi.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Sep 2018 00:10:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1538031530-25489-1-git-send-email-arunks@codeaurora.org>
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

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTI6Mjg6NTBQTSArMDUzMCwgQXJ1biBLUyB3cm90ZToK
PiArCV9fZnJlZV9wYWdlc19ib290X2NvcmUocGFnZSwgb3JkZXIpOwoKSSBhbSBub3Qgc3VyZSwg
YnV0IGlmIHdlIGFyZSBnb2luZyB0byB1c2UgdGhhdCBmdW5jdGlvbiBmcm9tIHRoZSBtZW1vcnkt
aG90cGx1ZyBjb2RlLAp3ZSBtaWdodCB3YW50IHRvIHJlbmFtZSB0aGF0IGZ1bmN0aW9uIHRvIHNv
bWV0aGluZyBtb3JlIGdlbmVyaWM/ClRoZSB3b3JkICJib290IiBzdWdnZXN0cyB0aGF0IHRoaXMg
aXMgb25seSBjYWxsZWQgZnJvbSB0aGUgYm9vdCBzdGFnZS4KCkFuZCB3aGF0IGFib3V0IHRoZSBw
cmVmZXRjaCBvcGVyYXRpb25zPyAKSSBzYXcgdGhhdCB5b3UgcmVtb3ZlZCB0aGVtIGluIHlvdXIg
cHJldmlvdXMgcGF0Y2ggYW5kIHRoYXQgaGFkIHNvbWUgYmVuZWZpdHMgWzFdLgoKU2hvdWxkIHdl
IHJlbW92ZSB0aGVtIGhlcmUgYXMgd2VsbD8KClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzEwNjEzMzU5LyAKClRoYW5rcwotLSAKT3NjYXIgU2FsdmFkb3IKU1VTRSBMMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
