From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Thu, 29 Nov 2018 10:19:44 +0200
Message-ID: <c3dfacd9-8dc3-1dd8-4f38-ee0d886c8921@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
 <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
 <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jweg=oi=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gSHY6-0007p1-DX
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 08:19:50 +0000
Received: by mail-lj1-x22e.google.com with SMTP id t9-v6so913849ljh.6
 for <xen-devel@lists.xenproject.org>; Thu, 29 Nov 2018 00:19:49 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: nd@arm.com, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCk9uIDI3LjExLjE4IDIzOjI3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gSGkgQW5kcmlpLAo+IAo+IFNlZSB0aGUgZm9sbG93aW5nOgo+IAo+IGh0dHBzOi8vbWFy
Yy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE0ODY2ODgxNzcwNDY2OApUaGFuayB5b3UgZm9yIHRoZSBw
b2ludC4gSSByZW1lbWJlciB0aGlzIGVtYWlsLCBidXQgbWlzc2VkIGl0IGFsc28gZ2l2ZXMgCmRl
dGFpbHMgdG8gc2V0dXAgdGhlIGV4cGVyaW1lbnQuIEl0IGxvb2tzIHRoYXQgYmFyZS1tZXRhbCBh
cHAgaXMgbm90IFNvQyAKc3BlY2lmaWMsIHNvIGdvaW5nIHRvIHRha2UgaXQgaW4gdXNlLgoKPiBU
aGUgbnVtYmVycyBoYXZlIGltcHJvdmVkIG5vdyB0aGFua3MgdG8gdndmaT1uYXRpdmUgYW5kIG90
aGVyCj4gb3B0aW1pemF0aW9ucyBidXQgdGhlIG1lY2hhbmlzbSB0byBzZXR1cCB0aGUgZXhwZXJp
bWVudCBhcmUgdGhlIHNhbWUuSSBrbm93IGFib3V0IGB2d2ZpPW5hdGl2ZWAgYnV0IGl0IGRvZXMg
bm90IGZpdCBvdXIgcmVxdWlyZW1lbnRzIDooCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
