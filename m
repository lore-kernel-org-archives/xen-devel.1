From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen,x86: introduce tcg_errata
Date: Thu, 25 Jan 2018 11:43:21 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801251057591.11958@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1801251035430.11958@sstabellini-ThinkPad-X260>
 <62646f15-19de-e626-4a65-4e8dc2fc0025@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1952522604-1516906886=:11958"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <62646f15-19de-e626-4a65-4e8dc2fc0025@citrix.com>
Content-ID: <alpine.DEB.2.10.1801251137230.11958@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1952522604-1516906886=:11958
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1801251137231.11958@sstabellini-ThinkPad-X260>

On Thu, 25 Jan 2018, Andrew Cooper wrote:
> On 25/01/18 18:37, Stefano Stabellini wrote:
> > The TCG emulator in QEMU is not good enough to pass the the tests in
> > stub_selftest. Detect if Xen is running on TCG early, then drop the
> > tests if it is the case.
> >
> > Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I'm still opposed to this change.  The selftests demonstrate that TCG
> doesn't work for an architectural area we depend, and simply pretending
> its not buggy isn't ok.  If this were a piece of real hardware, it would
> be blacklisted in a similar fashion to XSA-9.

> I still haven't seen a convincing enough usecase to cause Xen to
> proactively look for Qemu in all cases including release builds on real
> hardware.

Testing is a very good use case. It doesn't have to replace testing on
real hardware, it can complement it. You can try it yourself, it might
become your new favorite test environment :-) Just launch
qemu-system-x86_64 with -cpu qemu64,+svm. FYI this is my full command
line:

qemu-system-x86_64 -m 4G -smp 2 -cpu qemu64,+svm \
    -nographic -serial stdio -monitor none \
    --bios /usr/share/ovmf/OVMF.fd \
    -netdev user,id=hostnet0 -device virtio-net-pci,netdev=hostnet0,bus=pci.0,addr=0x3 \
    -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x6 \
    -drive file=$DISK,if=none,id=drive-virtio-disk0,format=raw,cache=none \
    -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1 \
    -device virtio-rng-pci


I haven't investigated yet the QEMU side of the problem. I can dig
deeper there, then, once we understand the full extent of the issue,
we could decide what to do with this patch. However, I performed a few
tests so far and I haven't seen any other issues. I can start HVM and
PVH guests without issues.
--8323329-1952522604-1516906886=:11958
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1952522604-1516906886=:11958--
