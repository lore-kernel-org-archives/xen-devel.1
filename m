From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Mon, 8 Oct 2018 09:34:22 +0200
Message-ID: <20181008073421.GA9703__9209.93409022248$1538984011$gmane$org@techadventures.net>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q9rc=mu=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1g9Q3e-0008MJ-FN
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 07:34:26 +0000
Received: by mail-wm1-f66.google.com with SMTP id y140-v6so8086222wmd.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Oct 2018 00:34:24 -0700 (PDT)
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
ZSBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBLUyA8YXJ1bmtzQGNvZGVhdXJvcmEu
b3JnPgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBPc2NhciBTYWx2YWRvciA8b3Nh
bHZhZG9yQHN1c2UuZGU+CgpKdXN0IG9uZSB0aGluZyBiZWxvdzoKICAKPiBAQCAtMTMzMSw3ICsx
MzMxLDcgQEAgdm9pZCBfX2luaXQgX19mcmVlX3BhZ2VzX2Jvb3RtZW0oc3RydWN0IHBhZ2UgKnBh
Z2UsIHVuc2lnbmVkIGxvbmcgcGZuLAo+ICB7Cj4gIAlpZiAoZWFybHlfcGFnZV91bmluaXRpYWxp
c2VkKHBmbikpCj4gIAkJcmV0dXJuOwo+IC0JcmV0dXJuIF9fZnJlZV9wYWdlc19ib290X2NvcmUo
cGFnZSwgb3JkZXIpOwo+ICsJcmV0dXJuIF9fZnJlZV9wYWdlc19jb3JlKHBhZ2UsIG9yZGVyKTsK
Cl9fZnJlZV9wYWdlc19jb3JlIGlzIHZvaWQsIHNvIEkgZ3Vlc3Mgd2UgZG8gbm90IG5lZWQgdGhh
dCByZXR1cm4gdGhlcmUuClByb2JhYmx5IHRoZSBjb2RlIGdlbmVyYXRlZCBpcyB0aGUgc2FtZSB0
aG91Z2guCi0tIApPc2NhciBTYWx2YWRvcgpTVVNFIEwzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
