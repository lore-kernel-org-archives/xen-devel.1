From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/8] efi: split out efi_shim_lock()
Date: Thu, 28 Jun 2018 07:43:50 -0600
Message-ID: <5B34E61602000078001CEDED@prv1-mh.provo.novell.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-7-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8/s5=jo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fYXDE-0006Cp-C5
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 13:43:52 +0000
In-Reply-To: <1529418946-30114-7-git-send-email-daniel.kiper@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA2LjE4IGF0IDE2OjM1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IC4ud2hpY2ggdmVyaWZpZXMgUEUgc2lnbmF0dXJlcyB3aXRoIFNISU1fTE9DSyBwcm90b2Nv
bC4gV2Ugd2FudAo+IHRvIHJlLXVzZSB0aGlzIGNvZGUgaW4gc3Vic2VxdWVudCBwYXRjaCBpbiBl
ZmlfbXVsdGlib290MigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBLaXBlciA8ZGFuaWVs
LmtpcGVyQG9yYWNsZS5jb20+CgpJIHRoaW5rIHRoaXMgd291bGQgYmV0dGVyIGJlIG1lcmdlZCB3
aXRoIHRoZSBwYXRjaCBhY3R1YWxseSBuZWVkaW5nIGl0LApidXQgYW55d2F5CkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
