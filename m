From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/8] cpupools: fix state when downing a CPU
 failed
Date: Mon, 16 Jul 2018 16:53:32 +0200
Message-ID: <cef83eea-9280-3cbe-ee82-60d08439991c@suse.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F26A02000078001D312F@suse.com>
 <fd2f91cd-b6f4-34aa-e05b-a855c984be56@suse.com>
 <5B4C629002000078001D4346@suse.com>
 <db67ac6c-192a-66ed-db73-a676c272598f@suse.com>
 <5B4C8D3702000078001D45EA@suse.com>
 <c678a828-b1d8-884e-44dc-d8e97611d1de@suse.com>
 <5B4C973D02000078001D4693@suse.com>
 <26d7f628-0a1e-1114-46c6-e2058acbb0c9@suse.com>
 <5B4CAB1202000078001D47BC@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x0fx=ka=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ff4sa-0007lv-DI
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:53:36 +0000
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 514D0AEB4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jul 2018 14:53:33 +0000 (UTC)
In-Reply-To: <5B4CAB1202000078001D47BC@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTY6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA3LjE4IGF0
IDE2OjIxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gU28gbWF5YmUgY2hhbmdpbmcgdGhl
IGNvbmRpdGlvbiBpbiBjcHVwb29sX2NwdV9hZGQoKSBzaG91bGQgYmUgc3BsaXQgb3V0Cj4+IGlu
dG8gYSBwYXRjaCBvZiBpdHMgb3duIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gYmFja3BvcnQgaXQ/
Cj4gCj4gV2UnbGwgd2FudC9uZWVkIHRvIGJhY2twb3J0IHRoaXMgY2hhbmdlIGFueXdheS4KCk9r
YXksIHNvIGV2ZW4gaWYgaXRzIGEgYnVnZml4IG9uIGl0cyBvd24gSSdtIGZpbmUgd2l0aCBrZWVw
aW5nIGl0IGluIHRoZQpwYXRjaC4gSW4gY2FzZSB5b3UgbGlrZSBzcGxpdHRpbmcgdGhlIHBhdGNo
ZXMgYmV0dGVyIEknbSBmaW5lLCB0b28uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
