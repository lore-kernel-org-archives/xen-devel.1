From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/hvm: make sure
 HVM_PARAM_[BUF]IOREQ_PFN can only be set once
Date: Mon, 08 Oct 2018 07:20:15 -0600
Message-ID: <5BBB598F02000078001EF972@prv1-mh.provo.novell.com>
References: <20181005134334.2645-1-paul.durrant@citrix.com>
 <20181005134334.2645-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bw27=mu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g9VSO-0003LS-8c
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 13:20:20 +0000
In-Reply-To: <20181005134334.2645-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDE1OjQzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZXNlIHBhcmFtZXRlcnMgc2hvdWxkIGhhdmUgYWx3YXlzIGJlZW4gaW4gdGhlICdzZXQg
b25jZScgY2F0ZWdvcnkKPiBidXQgdGhpcyBoYXMsIHNvIGZhciwgbm90IGJlZW4gZW5mb3JjZWQu
CgpIbW0sIG5vdyB0aGF0IEknbSBsb29raW5nIGF0IHBhdGNoIDIgSSBzZWUgd2hlcmUgdGhpcyBp
cyBjb21pbmcgZnJvbSwKYnV0IGEgaGludCB0b3dhcmRzIHRoaXMgaGVyZSB3b3VsZCBoYXZlIGhl
bHBlZCwgaWYgdGhpcyBpcyB0byBiZSBhCnNlcGFyYXRlIHBhdGNoIChmb2xkaW5nIGludG8gdGhl
IHNlY29uZCBwYXRjaCB3aXRoIGEgcmVzcGVjdGl2ZQpyZW1hcmsgd291bGQgcGVyaGFwcyBoYXZl
IGJlZW4gYmV0dGVyIGFueXdheSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
