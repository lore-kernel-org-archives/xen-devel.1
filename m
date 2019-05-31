From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/9] vm_event: Move struct vm_event_domain
 to vm_event.c
Date: Fri, 31 May 2019 16:44:20 -0700
Message-ID: <91ee93af-e42b-064f-1e7e-6f08a40d16c1@citrix.com>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <d50c5737dcff7f3225fe507322bb10d104a6e6b4.1559224640.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWrCM-0004cm-IH
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 23:44:34 +0000
In-Reply-To: <d50c5737dcff7f3225fe507322bb10d104a6e6b4.1559224640.git.ppircalabu@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMjAxOSAwNzoxOCwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOgo+IFRoZSB2bV9ldmVu
dF9kb21haW4gbWVtYmVycyBhcmUgbm90IGFjY2Vzc2VkIG91dHNpZGUgdm1fZXZlbnQuYyBzbyBp
dCdzCj4gYmV0dGVyIHRvIGhpZGUgZGUgaW1wbGVtZW50YXRpb24gZGV0YWlscy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CgpB
Y2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFyZSB0
aGVyZSBhbnkgZmlsZXMgd2hpY2ggbm93IG5vIGxvbmdlciBuZWVkIHRvIGluY2x1ZGUgc2NoZWQu
aCA/wqAKKFByb2JhYmx5IG5vdCwgYnV0IGl0IGlzIHdvcnRoIGNoZWNraW5nKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
