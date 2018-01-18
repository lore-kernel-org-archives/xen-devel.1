From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] x86/pv: Rename invalidate_shadow_ldt()
 to pv_destroy_ldt()
Date: Thu, 18 Jan 2018 00:45:16 -0700
Message-ID: <5A605E9C020000780019FB37@prv-mh.provo.novell.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-3-git-send-email-andrew.cooper3@citrix.com>
 <20180117144337.tqldlu3wzqxi6cez@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180117144337.tqldlu3wzqxi6cez@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE4IGF0IDE1OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBKYW4gMTIsIDIwMTggYXQgMDY6Mzc6MjFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gYW5kIG1vdmUgaXQgaW50byBwdi9kZXNjcmlwdG9yLXRhYmxlcy5jIGJlc2lkZSBp
dHMgR0RUIGNvdW50ZXJwYXJ0LiAgUmVkdWNlCj4+IHRoZSAhaW5faXJxKCkgY2hlY2sgZnJvbSBh
IEJVR19PTigpIHRvIEFTU0VSVCgpLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
