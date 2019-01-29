From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v5 1/8] microcode/intel: remove redundent
 check against ucode size
Date: Tue, 29 Jan 2019 21:34:18 +0800
Message-ID: <20190129133416.GA9095@gao-cwp>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-2-git-send-email-chao.gao@intel.com>
 <5C502A4A020000780014B80B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1edO=QF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1goTT0-0002Kc-IK
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 13:30:18 +0000
Content-Disposition: inline
In-Reply-To: <5C502A4A020000780014B80B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjksIDIwMTkgYXQgMDM6MjY6MThBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4gMDEvMjgvMTkgODowNiBBTSA+
Pj4KPj5UaGlzIGNoZWNrIGhhcyBiZWVuIGRvbmUgaW4gbWljcm9jb2RlX3Nhbml0eV9jaGVjaygp
LiBOZWVkbid0IGRvIGl0Cj4+YWdhaW4gaW4gZ2V0X21hdGNoaW5nX21pY3JvY29kZSgpLgo+Cj5C
dXQgd2hpbGUgdGhlcmUgYXJlIHR3byBjYWxsIHNpdGVzIG9mIGdldF9tYXRjaGluZ19taWNyb2Nv
ZGUoKSBvbmx5Cj5vbmUgaXMgcHJlY2VkZWQgYnkgYSBjYWxsIHRvIG1pY3JvY29kZV9zYW5pdHlf
Y2hlY2soKS4gVGhlcmUncyBhbHNvCj5ubyB2aXNpYmxlIGNvbm5lY3Rpb24gYmV0d2VlbiBjcHVf
cmVxdWVzdF9taWNyb2NvZGUoKSAod2hpY2ggZnJlZXMKPnRoZSBibG9iIGl0IGhhcyB2YWxpZGF0
ZWQpIGFuZCBtaWNyb2NvZGVfcmVzdW1lX21hdGNoKCkgKGFuZCBpbgo+cGFydGljdWxhciB0aGUg
YmxvYiBwYXNzZWQgaW50byB0aGVyZSkuIFdoYXQgYW0gSSBtaXNzaW5nPwoKbWljcm9jb2RlX3Jl
c3VtZV9tYXRjaCgpIHRha2VzIGEgY2FjaGVkIGJsb2I7IHRoZSBibG9iIHNob3VsZCBoYXZlIHBh
c3NlZAp0aGUgc2FuaXR5IGNoZWNrLiBJIHdpbGwgZXhwbGFpbiBpdCBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UuCgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
