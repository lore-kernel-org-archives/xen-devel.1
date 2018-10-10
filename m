From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Wed, 10 Oct 2018 10:07:24 +0200
Message-ID: <20181010080724.GA20338__15778.7922573791$1539158770$gmane$org@techadventures.net>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qmy3=mw=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1gA9Wk-0005Q8-35
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 08:07:30 +0000
Received: by mail-wm1-f45.google.com with SMTP id e187-v6so4679428wmf.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Oct 2018 01:07:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
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

T24gRnJpLCBPY3QgMDUsIDIwMTggYXQgMDE6NDA6MDVQTSArMDUzMCwgQXJ1biBLUyB3cm90ZToK
PiBXaGVuIGZyZWUgcGFnZXMgYXJlIGRvbmUgd2l0aCBoaWdoZXIgb3JkZXIsIHRpbWUgc3BlbmQg
b24KPiBjb2FsZXNjaW5nIHBhZ2VzIGJ5IGJ1ZGR5IGFsbG9jYXRvciBjYW4gYmUgcmVkdWNlZC4g
V2l0aAo+IHNlY3Rpb24gc2l6ZSBvZiAyNTZNQiwgaG90IGFkZCBsYXRlbmN5IG9mIGEgc2luZ2xl
IHNlY3Rpb24KPiBzaG93cyBpbXByb3ZlbWVudCBmcm9tIDUwLTYwIG1zIHRvIGxlc3MgdGhhbiAx
IG1zLCBoZW5jZQo+IGltcHJvdmluZyB0aGUgaG90IGFkZCBsYXRlbmN5IGJ5IDYwJS4gTW9kaWZ5
IGV4dGVybmFsCj4gcHJvdmlkZXJzIG9mIG9ubGluZSBjYWxsYmFjayB0byBhbGlnbiB3aXRoIHRo
ZSBjaGFuZ2UuCgpIaSBBcnVuLCBvdXQgb2YgY3VyaW9zaXR5OgoKY291bGQgeW91IHBsZWFzZSBl
eHBsYWluIGhvdyBleGFjdGx5IGRpZCB5b3UgbWVzdXJlIHRoZSBzcGVlZAppbXByb3ZlbWVudD8K
ClRoYW5rcwotLSAKT3NjYXIgU2FsdmFkb3IKU1VTRSBMMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
