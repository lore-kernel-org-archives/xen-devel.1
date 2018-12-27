From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 00/20] drop useless LIST_HEAD
Date: Thu, 27 Dec 2018 16:40:55 +0300
Message-ID: <20181227134055.GA2272__29477.2619069137$1545918364$gmane$org@kadam>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAKR_QVJefW1vxYb7-qiU8=0YdbFghYo15SK2eGjOC-dntRfyYA@mail.gmail.com>
 <alpine.DEB.2.21.1812232304130.2940@hadrien>
 <CAKR_QVLeZBL43W4x1mzcfcakSZyyh9L81vgUMxfnSccKawEfdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4+eo=PE=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1gcW0F-0004pQ-V0
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 13:47:12 +0000
Content-Disposition: inline
In-Reply-To: <CAKR_QVLeZBL43W4x1mzcfcakSZyyh9L81vgUMxfnSccKawEfdg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tom Psyborg <pozega.tomislav@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-btrfs@vger.kernel.org, dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMjUsIDIwMTggYXQgMTE6MTI6MjBQTSArMDEwMCwgVG9tIFBzeWJvcmcgd3Jv
dGU6Cj4gdGhlcmUgd2FzIGRpc2N1c3Npb24gYWJvdXQgdGhpcyBqdXN0IHNvbWUgZGF5cyBhZ28u
IENDIDQtNSBsaXN0cyBpcwo+IG1vcmUgdGhhbiBlbm91Z2gKPiAKCkkgZG9uJ3Qga25vdyB3aG8g
eW91IHdlcmUgZGlzY3Vzc2luZyB0aGlzIHdpdGguLi4KCllvdSBzaG91bGQgQ0MgdGhlIDB0aCBw
YXRjaCB0byBhbGwgdGhlIG1haWxpbmdsaXN0cy4gIFRoYXQgbXVjaCBpcyBhCmNsZWFyIHJ1bGUu
CgpGb3IgdGhlIHJlc3QsIEp1bGlhJ3MgcG9zaXRpb24gaXMgdGhlIG1vcmUgY29uc2VydmF0aXZl
IG9uZS4gIEkgd2FzIGluCmEgY29udmVyc2F0aW9uIGluIFJMIGFuZCB0aGV5IHdlcmUgbGlrZSwg
IkNDIGV2ZXJ5b25lIGZvciBhbGwgdGhlCnBhdGNoZXMiLiAgSXQgZGVwZW5kcyBvbiB0aGUgY29u
dGV4dCwgb2YgY291cnNlLiAgSWYgdGhlIHBhdGNoZXMgYXJlCmRlcGVuZGVudCBvbiBlYWNoIG90
aGVyIHRoZW4geW91ICpoYXZlKiB0byBDQyBldmVyeW9uZSBmb3IgZXZlcnl0aGluZy4KCklmIHdl
IHJlYWxseSBoYXZlIG90aGVyIGNsZWFyIHJ1bGVzLCB0aGVuIGl0IHNob3VsZCBiZSBlbmNvZGVk
IGludG8KZ2V0X21haW50YWluZXIucGwgc28gdGhhdCBpdCdzIGF1dG9tYXRpYy4KCk15IG90aGVy
IHF1ZXN0aW9uIGlzIHdoeSBkbyB0aGUgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCnBlb3BsZSBmZWVsIGxpa2UgdGhleSBuZWVkIHRvIGJlIENDJ2QgYWJvdXQgZXZlcnkgZHJp
dmVyPz8/ICBJIGFsd2F5cwpyZW1vdmUgdGhlbSBmcm9tIHRoZSBDQyBsaXN0IHVubGVzcyBpdCdz
IGFuIGFyY2gvYXJtIGlzc3VlLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKUFM6ICBQbGVhc2Us
IG5vIG1vcmUgdG9wIHBvc3RpbmcuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
