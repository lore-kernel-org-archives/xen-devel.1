From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 12/14] xen/gnttab: Drop
 gnttab_create_{shared, status}_page()
Date: Thu, 22 Nov 2018 08:47:07 -0700
Message-ID: <5BF6CF7B02000078001FF0A9@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-13-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-13-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDE0OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCgpIGlzIGEgY29tbW9uIEFQSS4gIFVzZSBp
dCBkaXJlY3RseSByYXRoZXIgdGhhbgo+IHdyYXBwaW5nIGl0IHdpdGggdW5uZWNlc3NhcnkgYm9p
bGVycGxhdGUuCgpJIHdhcyB3b25kZXJpbmcgYSBjb3VwbGUgb2YgdGltZXMgd2hldGhlciB3ZSBz
aG91bGQgdW5kbyB0aGlzICJhYnN0cmFjdGlvbiIuCkkgc2ltcGx5IHdhc24ndCBzdXJlIHdoeSB0
aGlzIGhhZCBiZWVuIGludHJvZHVjZWQgaW4gdGhlIGZpcnN0IHBsYWNlIC0gcGVyaGFwcwpqdXN0
IGR1cmluZyBlYXJseSBBcm0gYnJpbmd1cC4KCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CmFzIGxvbmcgYXMgdGhlIEFybSBndXlzIGRvbid0IGV4cGVjdCB0
byBuZWVkIHRoaXMgYmFjayBhdCBzb21lIHBvaW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
