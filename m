From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [PATCH v1 0/6] mm: online/offline_pages called w.o.
 mem_hotplug_lock
Date: Wed, 19 Sep 2018 11:22:07 +1000
Message-ID: <20180919012207.GD8537__20084.5015621328$1537320076$gmane$org@350D>
References: <20180918114822.21926-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4leo=mb=gmail.com=bsingharora@srs-us1.protection.inumbo.net>)
 id 1g2RC1-0007hu-Mm
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 01:22:13 +0000
Received: by mail-pf1-x444.google.com with SMTP id h69-v6so1861946pfd.4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Sep 2018 18:22:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180918114822.21926-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDE6NDg6MTZQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gUmVhZGluZyB0aHJvdWdoIHRoZSBjb2RlIGFuZCBzdHVkeWluZyBob3cgbWVt
X2hvdHBsdWdfbG9jayBpcyB0byBiZSB1c2VkLAo+IEkgbm90aWNlZCB0aGF0IHRoZXJlIGFyZSB0
d28gcGxhY2VzIHdoZXJlIHdlIGNhbiBlbmQgdXAgY2FsbGluZwo+IGRldmljZV9vbmxpbmUoKS9k
ZXZpY2Vfb2ZmbGluZSgpIC0gb25saW5lX3BhZ2VzKCkvb2ZmbGluZV9wYWdlcygpIHdpdGhvdXQK
PiB0aGUgbWVtX2hvdHBsdWdfbG9jay4gQW5kIHRoZXJlIGFyZSBvdGhlciBwbGFjZXMgd2hlcmUg
d2UgY2FsbAo+IGRldmljZV9vbmxpbmUoKS9kZXZpY2Vfb2ZmbGluZSgpIHdpdGhvdXQgdGhlIGRl
dmljZV9ob3RwbHVnX2xvY2suCj4gCj4gV2hpbGUgZS5nLgo+IAllY2hvICJvbmxpbmUiID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9tZW1vcnkvbWVtb3J5OS9zdGF0ZQo+IGlzIGZpbmUsIGUuZy4KPiAJ
ZWNobyAxID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9tZW1vcnkvbWVtb3J5OS9vbmxpbmUKPiBXaWxs
IG5vdCB0YWtlIHRoZSBtZW1faG90cGx1Z19sb2NrLiBIb3dldmVyIHRoZSBkZXZpY2VfbG9jaygp
IGFuZAo+IGRldmljZV9ob3RwbHVnX2xvY2suCj4gCj4gRS5nLiB2aWEgbWVtb3J5X3Byb2JlX3N0
b3JlKCksIHdlIGNhbiBlbmQgdXAgY2FsbGluZwo+IGFkZF9tZW1vcnkoKS0+b25saW5lX3BhZ2Vz
KCkgd2l0aG91dCB0aGUgZGV2aWNlX2hvdHBsdWdfbG9jay4gU28gd2UgY2FuCj4gaGF2ZSBjb25j
dXJyZW50IGNhbGxlcnMgaW4gb25saW5lX3BhZ2VzKCkuIFdlIGUuZy4gdG91Y2ggaW4gb25saW5l
X3BhZ2VzKCkKPiBiYXNpY2FsbHkgdW5wcm90ZWN0ZWQgem9uZS0+cHJlc2VudF9wYWdlcyB0aGVu
Lgo+IAo+IExvb2tzIGxpa2UgdGhlcmUgaXMgYSBsb25nZXIgaGlzdG9yeSB0byB0aGF0IChzZWUg
UGF0Y2ggIzIgZm9yIGRldGFpbHMpLAo+IGFuZCBmaXhpbmcgaXQgdG8gd29yayB0aGUgd2F5IGl0
IHdhcyBpbnRlbmRlZCBpcyBub3QgcmVhbGx5IHBvc3NpYmxlLiBXZQo+IHdvdWxkIGUuZy4gaGF2
ZSB0byB0YWtlIHRoZSBtZW1faG90cGx1Z19sb2NrIGluIGRldmljZS9iYXNlL2NvcmUuYywgd2hp
Y2gKPiBzb3VuZHMgd3JvbmcuCj4gCj4gU3VtbWFyeTogV2UgaGFkIGEgbG9jayBpbnZlcnNpb24g
b24gbWVtX2hvdHBsdWdfbG9jayBhbmQgZGV2aWNlX2xvY2soKS4KPiBNb3JlIGRldGFpbHMgY2Fu
IGJlIGZvdW5kIGluIHBhdGNoIDMgYW5kIHBhdGNoIDYuCj4gCj4gSSBwcm9wb3NlIHRoZSBnZW5l
cmFsIHJ1bGVzIChkb2N1bWVudGF0aW9uIGFkZGVkIGluIHBhdGNoIDYpOgo+IAo+IDEuIGFkZF9t
ZW1vcnkvYWRkX21lbW9yeV9yZXNvdXJjZSgpIG11c3Qgb25seSBiZSBjYWxsZWQgd2l0aAo+ICAg
IGRldmljZV9ob3RwbHVnX2xvY2suCj4gMi4gcmVtb3ZlX21lbW9yeSgpIG11c3Qgb25seSBiZSBj
YWxsZWQgd2l0aCBkZXZpY2VfaG90cGx1Z19sb2NrLiBUaGlzIGlzCj4gICAgYWxyZWFkeSBkb2N1
bWVudGVkIGFuZCBob2xkcyBmb3IgYWxsIGNhbGxlcnMuCj4gMy4gZGV2aWNlX29ubGluZSgpL2Rl
dmljZV9vZmZsaW5lKCkgbXVzdCBvbmx5IGJlIGNhbGxlZCB3aXRoCj4gICAgZGV2aWNlX2hvdHBs
dWdfbG9jay4gVGhpcyBpcyBhbHJlYWR5IGRvY3VtZW50ZWQgYW5kIHRydWUgZm9yIG5vdyBpbiBj
b3JlCj4gICAgY29kZS4gT3RoZXIgY2FsbGVycyAocmVsYXRlZCB0byBtZW1vcnkgaG90cGx1Zykg
aGF2ZSB0byBiZSBmaXhlZCB1cC4KPiA0LiBtZW1faG90cGx1Z19sb2NrIGlzIHRha2VuIGluc2lk
ZSBvZiBhZGRfbWVtb3J5L3JlbW92ZV9tZW1vcnkvCj4gICAgb25saW5lX3BhZ2VzL29mZmxpbmVf
cGFnZXMuCj4gCj4gVG8gbWUsIHRoaXMgbG9va3Mgd2F5IGNsZWFuZXIgdGhhbiB3aGF0IHdlIGhh
dmUgcmlnaHQgbm93IChhbmQgZWFzaWVyIHRvCj4gdmVyaWZ5KS4gQW5kIGxvb2tpbmcgYXQgdGhl
IGRvY3VtZW50YXRpb24gb2YgcmVtb3ZlX21lbW9yeSwgdXNpbmcKPiBsb2NrX2RldmljZV9ob3Rw
bHVnIGFsc28gZm9yIGFkZF9tZW1vcnkoKSBmZWVscyBuYXR1cmFsLgo+CgpUaGF0IHNlZW1zIHJl
YXNvbmFibGUsIGJ1dCBhbHNvIGltcGxpZXMgdGhhdCBkZXZpY2Vfb25saW5lKCkgd291bGQgaG9s
ZApiYWNrIGFkZC9yZW1vdmUgbWVtb3J5LCBjb3VsZCB5b3UgcGxlYXNlIGFsc28gZG9jdW1lbnQg
d2hhdCBtb2RlCnJlYWQvd3JpdGUgdGhlIGxvY2tzIG5lZWQgdG8gYmUgaGVsZD8gRm9yIGV4YW1w
bGUgY2FuIHRoZSBkZXZpY2VfaG90cGx1Z19sb2NrCmJlIGhlbGQgaW4gcmVhZCBtb2RlIHdoaWxl
IGFkZC9yZW1vdmUgbWVtb3J5IHZpYSAobWVtX2hvdHBsdWdfbG9jaykgaXMgaGVsZAppbiB3cml0
ZSBtb2RlPwoKQmFsYmlyIFNpbmdoLgogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
