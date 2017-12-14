From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/efer: Make {read,
 write}_efer() into inline helpers
Date: Thu, 14 Dec 2017 07:37:04 -0700
Message-ID: <5A329AA0020000780019762D@prv-mh.provo.novell.com>
References: <1513161382-7140-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1513161382-7140-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE3IGF0IDExOjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlIG92ZXJoZWFkIG9mIGEgY2FsbCB0byBhIHNl
cGFyYXRlIHRyYW5zbGF0aW9uIHVuaXQuCgpJbmRlZWQsIHRoZSBtb3JlIHRoYXQgdGhlIHBlci1D
UFUgdmFyaWFibGUgd2Fzbid0IGV2ZW4gc3RhdGljLgoKPiBXaGlsZSBtb3ZpbmcgdGhlIGltcGxl
bWVudGF0aW9uLCB1cGRhdGUgdGhlbSB0byB1c2UgdWludDY0X3Qgb3ZlciB1NjQKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
