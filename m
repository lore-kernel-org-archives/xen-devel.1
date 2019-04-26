Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD795C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA096206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA096206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJxSR-00064u-B7; Fri, 26 Apr 2019 09:47:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJxSP-00064p-UZ
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:47:49 +0000
X-Inumbo-ID: 594f7c95-6808-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 594f7c95-6808-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 09:47:48 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 03:47:47 -0600
Message-Id: <5CC2D3BD0200007800229607@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 03:47:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Rich Persaud" <persaur@gmail.com>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
 <DB7FD117-5AFE-4D4E-8BA6-A08475E48923@gmail.com>
In-Reply-To: <DB7FD117-5AFE-4D4E-8BA6-A08475E48923@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [VOTE] tagging for operational messages sent to
 xen-devel@ (was Re: Xen 4.13 Development Update)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org,
 Pu Wen <puwen@hygon.cn>, Luwei Kang <luwei.kang@intel.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426094741.dgthtvdDO_gUx59h8XzSKShiaiy2fYTe0N0-VSJQoig@z>

Pj4+IE9uIDI2LjA0LjE5IGF0IDAwOjU5LCA8cGVyc2F1ckBnbWFpbC5jb20+IHdyb3RlOgo+PiAg
T24gQXByIDI1LCAyMDE5LCBhdCAxMjozNiwgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXgu
Y29tPiB3cm90ZToKPj4gCj4+IEFscmlnaHQsCj4+IAo+PiB0aGVyZSB3YXMgYSBsZW5ndGh5IGRp
c2N1c3Npb24gb24gdGhpcyB0b3BpYyBvbiBJUkMgLSBsb2cgYXR0YWNoZWQuIFRoZSAKPiBjb25z
ZW5zdXMgYXBwZWFycyB0byBiZSB0byB1c2UgQ2Fub25pY2FsIG1lc3NhZ2VzIHdpdGggYSBDQVBJ
VEFMSVNFRCB0YWcuIAo+IEUuZy4gIltUQUddIFhlbiA0LjEzIERldmVsb3BtZW50IFVwZGF0ZSIu
Cj4+IAo+PiBUaGUgb3B0aW9ucyB3aGljaCBzZWVtZWQgdG8gaGF2ZSBsZWFzdCBvYmplY3Rpb25z
IGFyZQo+PiAxOiBbQU5OT1VOQ0VdCj4+IDI6IFtPUEVSQVRJT05TXSAKPj4gMzogW1BST0NFU1Nd
Cj4+IAo+PiBBbmQgdGhhdCB3ZSBzaG91bGQgdXNlIHRoZXNlIGZvciBvdGhlciBtZXNzYWdlcy9h
bm5vdW5jZW1lbnRzIHJlbGF0ZWQgdG8gdGhlIAo+IG9wZXJhdGlvbiBvZiBYZW4gUHJvamVjdCBE
ZXZlbG9wbWVudC4KPiAKPiBPbiBtb2JpbGUgZGV2aWNlcywgc2hvcnRlciBzdWJqZWN0cyBhcmUg
YmV0dGVyLiAgQSBbeGVuLWRldmVsXSBlbWFpbCBhbHJlYWR5IAo+IGhhcyBvbmUgMTEtY2hhcmFj
dGVyIHRhZy4gU2luY2UgdGFncyBhcmUgaW4gQ0FQSVRBTFMsIGFiYnJldmlhdGVkIHRhZ3MgPSBs
ZXNzIAo+IFNIT3V0aW5nLgo+IAo+PiBbRGl6aWV0XSBPbmx5IGJlY2F1c2Ugd2UgY29weSBldmVy
eXRoaW5nIGZyb20gLWFubm91bmNlIHRvIC1kZXZlbC4KPiAKPiBTb21lIG1haWxpbmcgbGlzdHMg
dXNlIFtBTk5dIGZvciBhbm5vdW5jZW1lbnRzLiAgRW1haWwgbWlycm9yZWQgdG8geGVuLWRldmVs
IAo+IGZyb20gLWFubm91bmNlIGNvdWxkIHByZWZpeCB0aGUgW0FOTl0gdGFnLCB3aGljaCB3b3Vs
ZCBub3QgYmUgdXNlZCBmb3IgCj4gbm9uLW1pcnJvcmVkIGVtYWlsLCBzaW5jZSBhbGwgYW5ub3Vu
Y2VtZW50cyB3b3VsZCBiZSBkaXJlY3RlZCB0byAtYW5ub3VuY2UuCj4gCj4+IFtnd2RdIEJ1dCBp
biBteSBtaW5kLCB0aGluZ3MgbGlrZSBSTSB1cGRhdGVzICh3aGljaCBoYXBwZW4gcHJldHR5IHJl
Z3VsYXJseSkgCj4gYW5kIHNheSwgRGV2ZWxvcGVyIFN1bW1pdCBhbm5vdW5jZW1lbnRzLCBhcmUg
ZGlmZmVyZW50IHRoaW5ncy4KPiAKPiBUaGUgbWVzc2FnZXMgd2hpY2ggcHJvbXB0ZWQgdGhpcyBk
aXNjdXNzaW9uIHdlcmUgcmVsYXRlZCB0byByZWxlYXNlIAo+IG1hbmFnZW1lbnQuICBUaGVzZSB3
ZXJlIGNhbGxlZCBSTSBpbiB0aGUgSVJDIGRpc2N1c3Npb24sIHdoaWNoIHN1Z2dlc3RzIFtSTV0g
Cj4gYXMgYSBwb3NzaWJsZSB0YWcuICBJdCdzIHF1aWNrIHRvIHR5cGUgYW5kIG5vbi1kaXN0cmFj
dGluZyB0byByZWFkLiAgVGhpcyAKPiB3b3VsZCBub3QgcHJlY2x1ZGUgb3RoZXIgdGFncyBmb3Ig
bm9uIFtSTV0gbWVzc2FnZXMuCgpPdG9oIHRoZSBzaG9ydGVyIHlvdSBtYWtlIGEgdGFnLCB0aGUg
bW9yZSBhbWJpZ3VvdXMgaXQgYmVjb21lcy4KVGhpcyBtYXkgbm90IGJlIGFuIGlzc3VlIHRvIHBl
b3BsZSBpbnZvbHZlZCBpbiB0aGUgZGlzY3Vzc2lvbiBoZXJlLApvciByZWd1bGFybHkgcmVhZGlu
ZyB0aGUgbGlzdCwgYnV0IGl0IG1heSBlYXNpbHkgYmUgY29uZnVzaW5nIHRvIG90aGVycwooYW5k
IGV2ZW4gdGhlIG9uZXMgbWVudGlvbmVkIGZpcnN0LCBpZiBpdCBnZXRzIHVzZWQgcmFyZWx5IGVu
b3VnaCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
