From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Tue, 23 Apr 2019 11:00:46 +0100
Message-ID: <d16d6145-a219-6c88-3d4c-8dfe40efa5ab@citrix.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIsF3-0003N5-Qg
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:01:33 +0000
In-Reply-To: <155577388740.25746.3780283868034526234.stgit@wayrath>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMjAxOSAxNjoyNCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gSW4gc2NoZWR1bGUo
KSwgaWYgd2UgcGljaywgYXMgdGhlIG5leHQgdmNwdSB0byBydW4gKG5leHQpIHRoZSBzYW1lIG9u
ZQo+IHRoYXQgaXMgcnVubmluZyBhbHJlYWR5IChwcmV2KSwgd2UgbmV2ZXIgZ2V0IHRvIGNhbGwg
Y29udGV4dF9zd2l0Y2goKS4KPgo+IFdlIGNhbiwgdGhlcmVmb3JlLCBnZXQgcmlkIG9mIGFsbCB0
aGUgYGlmYC1zIHRlc3RpbmcgcHJldiBhbmQgbmV4dCBiZWluZwo+IGRpZmZlcmVudCwgdHJhZGlu
ZyB0aGVtIHdpdGggYW4gQVNTRVJUKCkgKG9uIEFSTSwgdGhlIEFTU0VSVCgpIHdhcyBldmVuCj4g
YWxyZWFkeSB0aGVyZSEpCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPgo+IFN1Z2dlc3RlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpJJ2xsIHB1bGwgdGhpcyBpbnRvIHg4Ni1uZXh0IGdpdmVuIGEgY29tcGxldGUgc2V0IG9mIFIv
QS1ieSdzCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
