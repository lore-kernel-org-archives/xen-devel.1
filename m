From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 1/8] xen/page_alloc: Move
 get_pg_owner()/put_pg_owner() from x86 to common code
Date: Fri, 21 Dec 2018 02:12:45 -0700
Message-ID: <5C1CAE8D020000780020868B@prv1-mh.provo.novell.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
 <20181220192338.17526-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gaGrT-0001g7-2J
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 09:12:51 +0000
In-Reply-To: <20181220192338.17526-2-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Benjamin Sanda <ben.sanda@dornerworks.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDIwOjIzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEZyb206IEJlbmphbWluIFNhbmRhIDxiZW4uc2FuZGFAZG9ybmVyd29ya3MuY29tPgo+IAo+IGdl
dF9wZ19vd25lcigpIGFuZCBwdXRfcGdfb3duZXIoKSB3aWxsIGJlIG5lY2Vzc2FyeSBpbiBhIGZv
bGxvdy11cAo+IGNvbW1pdCB0byBzdXBwb3J0IHhlbnRyYWNlIG9uIEFybS4gU28gbW92ZSB0aGUg
aGVscGVyIHRvIGNvbW1vbiBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIFNhbmRh
IDxiZW4uc2FuZGFAZG9ybmVyd29ya3MuY29tPgo+IFtqdWxpZW46IFJld29yayBjb21taXQgdGl0
bGUgLyB0dXJuIHB1dF9wZ19vd25lciB0byBhIG1hY3JvXQoKTml0OiBJdCdzIGFuIGlubGluZSBm
dW5jdGlvbiBub3cuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
