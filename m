From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH RFCv2 0/6] mm: online/offline_pages called
 w.o. mem_hotplug_lock
Date: Fri, 31 Aug 2018 22:54:57 +0200
Message-ID: <20180831205457.GB3945__34885.8002377257$1535777070$gmane$org@techadventures.net>
References: <20180821104418.12710-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=khe2=lo=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1fvqRZ-0002EB-OL
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 20:55:01 +0000
Received: by mail-wr1-f67.google.com with SMTP id g33-v6so12358933wrd.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Aug 2018 13:54:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180821104418.12710-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Pavel Tatashin <pasha.tatashin@oracle.com>, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, YASUAKI ISHIMATSU <yasu.isimatu@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Joonsoo
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMTI6NDQ6MTJQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gVGhpcyBpcyB0aGUgc2FtZSBhcHByb2FjaCBhcyBpbiB0aGUgZmlyc3QgUkZD
LCBidXQgdGhpcyB0aW1lIHdpdGhvdXQKPiBleHBvcnRpbmcgZGV2aWNlX2hvdHBsdWdfbG9jayAo
cmVxdWVzdGVkIGJ5IEdyZWcpIGFuZCB3aXRoIHNvbWUgbW9yZQo+IGRldGFpbHMgYW5kIGRvY3Vt
ZW50YXRpb24gcmVnYXJkaW5nIGxvY2tpbmcuIFRlc3RlZCBvbmx5IG9uIHg4NiBzbyBmYXIuCgpI
aSBEYXZpZCwKCkkgd291bGQgbGlrZSB0byByZXZpZXcgdGhpcyBidXQgSSBhbSBvbiB2YWNhdGlv
biwgc28gSSB3aWxsIG5vdCBiZSBhYmxlIHRvIGdldCB0byBpdApzb29uLgpJIHBsYW4gdG8gZG8g
aXQgb25jZSBJIGFtIGJhY2suCgpUaGFua3MKLS0gCk9zY2FyIFNhbHZhZG9yClNVU0UgTDMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
