From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: xen-pciback: fix warning Using plain
 integer as NULL pointer
Date: Mon, 8 Apr 2019 07:10:41 +0200
Message-ID: <66d79100-c66f-a043-0523-962632bd9cb7__4802.99729840539$1554700297$gmane$org@suse.com>
References: <20190406122912.GA403@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hDMYR-0004Pa-83
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 05:10:47 +0000
In-Reply-To: <20190406122912.GA403@hari-Inspiron-1545>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDQvMjAxOSAxNDoyOSwgSGFyaXByYXNhZCBLZWxhbSB3cm90ZToKPiBDaGFuZ2VzIHBh
c3NpbmcgZnVuY3Rpb24gYXJndW1lbnQgMCB0byBOVUxMIHRvIGF2b2lkIGJlbG93IHNwYXJzZQo+
IHdhcm5pbmcKPiAKPiAgQ0hFQ0sgICBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYwo+
IGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jOjcwMDo1MTogd2FybmluZzogVXNpbmcg
cGxhaW4gaW50ZWdlciBhcwo+IE5VTEwgcG9pbnRlcgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhcmlw
cmFzYWQgS2VsYW0gPGhhcmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
