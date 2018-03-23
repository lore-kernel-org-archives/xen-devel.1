From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Fri, 23 Mar 2018 11:38:44 +0000
Message-ID: <5AB4F55402000078001B5818@gwmail.emea.novell.com>
References: <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <20180322002540.000032f1@gmail.com>
 <20180321152017.bv32mt4bpxaa7zfr@MacBook-Pro-de-Roger.local>
 <20180322025656.00005281@gmail.com>
 <20180321171504.afl75q77kji34ybo@MacBook-Pro-de-Roger.local>
 <20180322084958.0000571c@gmail.com>
 <20180322095716.5y2hdyh6xp7nto3g@MacBook-Pro-de-Roger.local>
 <20180322222922.00006f7c@gmail.com>
 <20180322124402.wal7zdhadswqg3qk@MacBook-Pro-de-Roger.local>
 <20180323013105.00002a99@gmail.com>
 <4c586feb8e864f3591934c24b0b1ceba@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yzb5=gn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ezLLg-00066J-Jz
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 11:59:08 +0000
In-Reply-To: <4c586feb8e864f3591934c24b0b1ceba@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Alexey G' <x1917x@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAzLjE4IGF0IDExOjI5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE5vLCB0aGF0J3Mgbm90IHF1aXRlIHJpZ2h0LiBPbmx5IHFlbXUtdHJhZCAoYW5kIHN0dWJk
b20pIGFyZSAnZGVmYXVsdCcgaW9yZXEgCj4gc2VydmVycy4gVXBzdHJlYW0gUUVNVSBoYXMgcmVn
aXN0ZXJlZCBpbmRpdmlkdWFsIFBDSSBkZXZpY2VzIHdpdGggWGVuIGZvciAKPiBzb21lIHRpbWUg
bm93LCBhbmQgaGVuY2UgZ2V0cyBwcm9wZXIgUENJIGNvbmZpZyBJT1JFUXMuIEFsc28gd2UgcmVh
bGx5IHJlYWxseSAKPiB3YW50IGRlZmF1bHQgaW9yZXEgc2VydmVycyBhcyB0aGVpciBpbnRlcmZh
Y2UgdG8gWGVuIGlzIGZyYWdpbGUgYW5kIGhhcyBvbmx5IAo+IGp1c3QgbmFycm93bHkgYXZvaWRl
ZCBiZWluZyBhIHNlY3VyaXR5IGlzc3VlLgoKRGlkIHlvdSBtaXNzIHNvbWUgImRvbid0IiBvciAi
dG8gZ28gYXdheSI/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
