From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Tue, 23 Apr 2019 10:47:01 +0100
Message-ID: <4e237119-9b7b-6f96-a50b-f8c996ba0c2c@citrix.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIs1I-0001VN-Et
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:47:20 +0000
In-Reply-To: <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMjAxOSAxMDoxMywgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBEYXJpbywK
Pgo+IE9uIDIwLjA0LjE5IDE4OjI0LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4gSW4gc2NoZWR1
bGUoKSwgaWYgd2UgcGljaywgYXMgdGhlIG5leHQgdmNwdSB0byBydW4gKG5leHQpIHRoZSBzYW1l
IG9uZQo+PiB0aGF0IGlzIHJ1bm5pbmcgYWxyZWFkeSAocHJldiksIHdlIG5ldmVyIGdldCB0byBj
YWxsIGNvbnRleHRfc3dpdGNoKCkuCj4KPiBBbmQgd2hhdCBhYm91dCBgaWYgKCBwcmV2ICE9IGN1
cnJlbnQgKWAgaW4gYXJtL2RvbWFpbi5jOnNjaGVkdWxlX3RhaWwoKSA/CgpzY2hlZHVsZV90YWls
KCkgaXMgY2FsbGVkIHdpdGggY3VycmVudCBmcm9tIHRoZSBjb250aW51ZV9ydW5uaW5nKCkgcGF0
aC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
