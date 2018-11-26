From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/4] xen/arch: Switch local_*_is_enabled()
 predicates to return bool
Date: Mon, 26 Nov 2018 06:04:14 -0700
Message-ID: <5BFBEF4E02000078001FFFB8@prv1-mh.provo.novell.com>
References: <1542991976-6190-1-git-send-email-andrew.cooper3@citrix.com>
 <1542991976-6190-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542991976-6190-2-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDIzLjExLjE4IGF0IDE3OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UsIGFzIHRoZSB2YWx1ZSByZXR1cm5lZCB3YXMgcHJl
dmlvdXNseSBhbHdheXMgMCBvciAxLgo+IFdoaWxlIGFsdGVyaW5nIHRoZXNlLCBpbnNlcnQgYmxh
bmsgbGluZXMgd2hlcmUgYXBwcm9wcmlhdGUgYW5kIGRyb3AgdGhlCj4gbm93LXJlZHVuZGFudCAh
ISBmcm9tIHg4NidzIGxvY2FsX2lycV9pc19lbmFibGVkKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
