From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] cpupool: fix ASSERT( c != old_pool )
Date: Mon, 08 Apr 2019 03:26:50 -0600
Message-ID: <5CAB13DA02000078002253F7@prv1-mh.provo.novell.com>
References: <1554691246-7249-1-git-send-email-fionali-oc@zhaoxin.com>
 <31983788-e4e4-5526-04a1-660c00930d0d@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDQYN-0007NI-6I
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 09:26:59 +0000
In-Reply-To: <31983788-e4e4-5526-04a1-660c00930d0d@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, FionaLi-oc <fionali-oc@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA0LjE5IGF0IDA3OjA5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
OC8wNC8yMDE5IDA0OjQwLCBGaW9uYUxpLW9jIHdyb3RlOgo+PiBBc3NpZ25pbmcgY3B1IHRvIGNw
dXBvb2wgbmVlZG4ndCB0byBzd2l0Y2ggY3B1IHNjaGVkdWxlciB3aGVuCj4+IHN5c3RlbSBzdGF0
ZSBpcyByZXN1bWUsIG90aGVyd2lzZSBpdCB3aWxsIGNhdXNlIEFTU0VSVCBpbgo+PiBzY2hlZHVs
ZV9jcHVfc3dpdGNoKCkuCj4gCj4gSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlzIG5lZWRlZCBv
biBjdXJyZW50IHN0YWdpbmcgdHJlZS4gQ29tbWl0Cj4gNjg3MGVhOWQxZmFkNmZiZTI3IGNoYW5n
ZWQgcmVzdW1lIGhhbmRsaW5nIGxlYWRpbmcgdG8KPiBjcHVwb29sX2Fzc2lnbl9jcHVfbG9ja2Vk
KCkgYmVpbmcgbm8gbG9uZ2VyIGNhbGxlZCB3aGVuIHJlc3VtaW5nLgoKQnV0IGlzIGl0IHNvbWV0
aGluZyB3b3J0aHdoaWxlIHRvIHB1dCBvbnRvIHN0YWJsZSB0cmVlcyAod2l0aCB0aGUKb25lIG1p
c3NpbmcgYmxhbmsgYWRkZWQpPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
