From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 02/12] microcode/intel: use union to get
 fields without shifting and masking
Date: Tue, 12 Mar 2019 10:43:23 -0600
Message-ID: <5C87E1AB020000780021DD55@prv1-mh.provo.novell.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-3-git-send-email-chao.gao@intel.com>
 <20190312153337.nt4dwkufcjc7zvqc@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rfzp=RP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3kV0-0003lu-H3
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 16:43:30 +0000
In-Reply-To: <20190312153337.nt4dwkufcjc7zvqc@Air-de-Roger>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAzLjE5IGF0IDE2OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDAzOjU3OjI2UE0gKzA4MDAsIENoYW8gR2FvIHdyb3Rl
Ogo+IAo+IFBsZWFzZSBhZGQgIk5vIGZ1bmN0aW9uYWwgY2hhbmdlIiB0byB0aGUgY29tbWl0IGRl
c2NyaXB0aW9uLgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+
IFRoaXMgY2FuIGxpa2VseSBnbyBpbiBhaGVhZCBvZiB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzLgoK
SW5kZWVkLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
