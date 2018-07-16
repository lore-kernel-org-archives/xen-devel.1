From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/8] cpupools: fix state when downing a CPU
 failed
Date: Mon, 16 Jul 2018 08:26:26 -0600
Message-ID: <5B4CAB1202000078001D47BC@prv1-mh.provo.novell.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F26A02000078001D312F@suse.com>
 <fd2f91cd-b6f4-34aa-e05b-a855c984be56@suse.com>
 <5B4C629002000078001D4346@suse.com>
 <db67ac6c-192a-66ed-db73-a676c272598f@suse.com>
 <5B4C8D3702000078001D45EA@suse.com>
 <c678a828-b1d8-884e-44dc-d8e97611d1de@suse.com>
 <5B4C973D02000078001D4693@suse.com>
 <26d7f628-0a1e-1114-46c6-e2058acbb0c9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6083=ka=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ff4SP-0005U9-MJ
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:26:33 +0000
In-Reply-To: <26d7f628-0a1e-1114-46c6-e2058acbb0c9@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDE2OjIxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBTbyBt
YXliZSBjaGFuZ2luZyB0aGUgY29uZGl0aW9uIGluIGNwdXBvb2xfY3B1X2FkZCgpIHNob3VsZCBi
ZSBzcGxpdCBvdXQKPiBpbnRvIGEgcGF0Y2ggb2YgaXRzIG93biBpbiBvcmRlciB0byBiZSBhYmxl
IHRvIGJhY2twb3J0IGl0PwoKV2UnbGwgd2FudC9uZWVkIHRvIGJhY2twb3J0IHRoaXMgY2hhbmdl
IGFueXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
