From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/mm: Make change_type_range return
 error
Date: Fri, 03 May 2019 02:04:52 -0600
Message-ID: <5CCBF624020000780022B83A@prv1-mh.provo.novell.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
 <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
 <a5ff20d2-2968-9c81-1ee9-1bfee5b2a48f@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMTBp-0003zS-VW
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:05:05 +0000
In-Reply-To: <a5ff20d2-2968-9c81-1ee9-1bfee5b2a48f@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA1LjE5IGF0IDA5OjUzLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIDI1LjA0LjIwMTkgMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJdCBpcyBhbiBp
c3N1ZSBhbnl3YXkgdGhhdCBhIGNoYW5nZSBpcwo+PiBtYWRlIHdpdGhvdXQgc2F5aW5nIHdoeSB0
aGUgbmV3IGJlaGF2aW9yIHByZWZlcmFibGUgb3Zlcgo+PiB0aGUgY3VycmVudCBvbmUuCj4gCj4g
U28gaXMgdGhlcmUgYSB3YXkgdG8gY29udGludWUgd2l0aCB0aGlzPwoKV2h5IG5vdCAtIEkndmUg
bm90IHNhaWQgSSdtIGFnYWluc3QsIEkndmUganVzdCBhc2tlZCBmb3IgYW4gaW1wcm92ZWQKZGVz
Y3JpcHRpb24uIE9mIGNvdXJzZSwgaWYgaXQgdHVybnMgb3V0IHRoZSBjaGFuZ2UgaXMgZG9uZSAi
anVzdCBpbgpjYXNlIiwgSSdtIG5vdCBzdXJlIEkgc2VlIG11Y2ggdmFsdWUuIEJ1dCBhcyB5b3Ug
c2F5LCBpdCdzIGZpcnN0IGFuZApmb3JlbW9zdCBHZW9yZ2UgdG8ganVkZ2UuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
